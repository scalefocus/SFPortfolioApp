//
//  ScannerViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 27.10.21.
//

import SFBaseKit

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
        timer = Timer.scheduledTimer(withTimeInterval: scanInterval, repeats: true) { [weak self] _ in
            self?.shouldSnapshot = true
        }
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    func didFinishScan(_ image: UIImage) {
        delegate?.didFinishScan(image, scanType: scanType)
    }
    
    func changeType(_ type: ScanType) {
        scanType = type
    }
    
}

// MARK: - Constants
fileprivate extension Constants {
    
    static let scanInterval = 2
    static let infoText = "Scanning every %d seconds"
    
}
