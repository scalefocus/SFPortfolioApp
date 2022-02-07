//
//  ScannerDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 28.10.21.
//

import SFBaseKit
import Vision

class ScannerDemoViewModel: ScannerDemoViewModelProtocol {
    
    // MARK: - Properties
    let infoText = Observable<String?>(nil)
    var title: String {
        CategoryItem.scannerView.title
    }
    
    // MARK: - Public Functions
    func scan(_ image: UIImage, scanType: ScanType) {
        switch scanType {
        case .text:
            scan(image)
        case .qr:
            infoText.value = image.parseQR()
        }
    }
    
    // MARK: - Private Functions
    private func scan(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            observations.forEach { observation in
                if let recognizedText = observation.topCandidates(1).first {
                    self?.infoText.value = recognizedText.string
                }
            }
        }
        
        request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? requestHandler.perform([request])
    }
    
}
