//
//  ScannerView.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 27.10.21.
//

import SFBaseKit
import AVFoundation

class ScannerView: BaseView {
    
    // MARK: - Properties
    private var captureSession: AVCaptureSession?
    private var rearCamera: AVCaptureDevice?
    private var rearCameraInput: AVCaptureDeviceInput?
    private var videoPreviewOutput: AVCaptureVideoDataOutput?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var viewModel: ScannerViewModelProtocol! {
        didSet {
            setupBinding()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var videoPreviewView: UIView!
    @IBOutlet private weak var captureView: UIView!
    @IBOutlet private weak var dimmedView: UIView!
    @IBOutlet private weak var captureViewHeight: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addDimmedMask()
    }
    
    deinit {
        viewModel.stop()
    }
    
    // MARK: - IBActions
    @IBAction private func didChangeSegmentControlValue(_ sender: UISegmentedControl) {
        guard let title = sender.titleForSegment(at: sender.selectedSegmentIndex),
              let scanType = ScanType(rawValue: title) else { return }
        
        resizeScanArea(for: scanType)
        addDimmedMask()
        viewModel.changeType(scanType)
    }
    
    // MARK: - Public Functions
    /// Configures scanning preview.
    func setup() {
        createrSession()
        configureCamera()
        addSessionInput()
        addSessionOutput()
    }
    
    /// Starts scanning.
    func startScan() {
        viewModel.start()
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let session = self?.captureSession,
                  !session.isRunning else { return }
            
            session.startRunning()
            DispatchQueue.main.async { [weak self] in
                self?.configVideoPreviewLayer(session: session)
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    /// Stops scanning.
    func stopScan() {
        viewModel.stop()
    }
    
    // MARK: - Private Functions
    private func setupBinding() {
        viewModel.infoText.sink { text in
            DispatchQueue.main.async { [weak self] in
                self?.infoLabel.text = text
            }
        }
    }
    
    private func createrSession() {
        captureSession = AVCaptureSession()
        let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera],
                                                       mediaType: .video,
                                                       position: .back)
        rearCamera = session.devices.first
    }
    
    private func configureCamera() {
        guard let rearCamera = rearCamera else { return }
        
        try? rearCamera.lockForConfiguration()
        rearCamera.focusMode = .continuousAutoFocus
        rearCamera.unlockForConfiguration()
    }
    
    private func addSessionInput() {
        guard let rearCamera = rearCamera else { return }
    
        rearCameraInput = try? AVCaptureDeviceInput(device: rearCamera)
        guard let rearCameraInput = rearCameraInput else { return }
        
        captureSession?.addInput(rearCameraInput)
    }
    
    private func addSessionOutput() {
        videoPreviewOutput = AVCaptureVideoDataOutput()
        videoPreviewOutput?.setSampleBufferDelegate(self, queue: DispatchQueue(label: "SampleBufferDispatch"))
        guard let videoPreviewOutput = videoPreviewOutput else { return }
        
        captureSession?.addOutput(videoPreviewOutput)
    }

    private func addDimmedMask() {
        dimmedView.layer.mask = nil
        let maskLayer = CAShapeLayer()
        let path = UIBezierPath(rect: contentView?.bounds ?? .zero)
        let capturePath = UIBezierPath(roundedRect: captureView.frame, cornerRadius: Constants.baseCornerRadius)
        path.append(capturePath)
        maskLayer.path = path.cgPath
        maskLayer.fillRule = .evenOdd
        dimmedView.layer.mask = maskLayer
        setNeedsDisplay()
    }
    
    private func configVideoPreviewLayer(session: AVCaptureSession?) {
        guard let session = session,
              videoPreviewLayer == nil else { return }
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer?.videoGravity = .resizeAspectFill
        videoPreviewLayer?.frame = videoPreviewView.layer.bounds
        videoPreviewView.layer.addSublayer(videoPreviewLayer ?? AVCaptureVideoPreviewLayer())
    }
    
    private func resizeScanArea(for scanType: ScanType) {
        let width = captureView.bounds.width
        let height = scanType == .qr ? width : Constants.defaultScanHeight
        captureViewHeight.constant = height
    }
    
    private func cropToPreviewLayer(image: CGImage) -> UIImage {
        guard let videoPreviewLayer = videoPreviewLayer else { return UIImage() }
        
        let outputRect = videoPreviewLayer.metadataOutputRectConverted(fromLayerRect: captureView.frame)
        let width = CGFloat(image.width)
        let height = CGFloat(image.height)
        let cropRect = CGRect(x: outputRect.origin.x * width,
                              y: outputRect.origin.y * height,
                              width: outputRect.size.width * width,
                              height: outputRect.size.height * height)
        guard let croppedImage = image.cropping(to: cropRect) else { return UIImage() }
        
        let croppedUIImage = UIImage(cgImage: croppedImage,
                                     scale: 1.0,
                                     orientation: .right)
        return croppedUIImage
    }
    
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
extension ScannerView: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
              viewModel.shouldSnapshot else { return }
        
        viewModel.shouldSnapshot = false
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }
       
        DispatchQueue.main.sync { [weak self] in
            guard let self = self else { return }
            
            let image = self.cropToPreviewLayer(image: cgImage)
            self.viewModel.didFinishScan(image)
        }
    }
    
}

// MARK: - Instantiate
extension ScannerView {
    
    static func create(delegate: ScannnerViewModelDelegate) -> ScannerView {
        let scannerView = ScannerView()
        let viewModel = ScannerViewModel(delegate: delegate)
        scannerView.viewModel = viewModel
        return scannerView
    }
    
}

// MARK: - Constants
private extension Constants {

    static let baseCornerRadius: CGFloat = 18
    static let defaultScanHeight: CGFloat = 37
    
}
