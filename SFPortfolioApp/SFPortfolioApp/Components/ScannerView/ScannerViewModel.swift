//
//  ScannerViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 27.10.21.
//

import SFBaseKit
import Vision

class ScannerViewModel: ScannerViewModelProtocol {
    
    // MARK: - Propertis
    let infoText: Observable<String>
    var shouldSnapshot = false
    weak var delegate: ScannnerViewModelDelegate?
    private let scanInterval: TimeInterval
    private var scanType: ScanType
    private var timer: Timer?
    
    // MARK: - Init
    init(scanInterval: Int = Constants.scanInterval,
         scanType: ScanType = .text,
         delegate: ScannnerViewModelDelegate? = nil) {
        self.scanInterval = TimeInterval(scanInterval)
        self.infoText = Observable(String(format: Constants.infoText, arguments: [scanInterval]))
        self.scanType = scanType
        self.delegate = delegate
    }
    
    // MARK: - Public Functions
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: scanInterval, repeats: true) { _ in
            self.shouldSnapshot = true
        }
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    func didFinishScan(_ image: UIImage) {
        switch scanType {
        case .text:
            recognizeText(in: image)
        case .qr:
            delegate?.didFinishScan(text: image.parseQR())
        }
    }
    
    func changeType(_ type: ScanType) {
        scanType = type
    }
    
    // MARK: - Private Functions
    private func recognizeText(in image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            observations.forEach { observation in
                if let recognizedText = observation.topCandidates(1).first {
                    self?.delegate?.didFinishScan(text: recognizedText.string)
                }
            }
        }
        
        request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? requestHandler.perform([request])
    }
    
}

// MARK: - Constants
fileprivate extension Constants {
    
    static let scanInterval = 2
    static let infoText = "Scanning every %d seconds"
    
}
