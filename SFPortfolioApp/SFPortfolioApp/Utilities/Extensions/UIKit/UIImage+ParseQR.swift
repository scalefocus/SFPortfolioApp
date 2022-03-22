//
//  UIImage+ParseQR.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 28.10.21.
//

import UIKit

extension UIImage {
    
    /// Transform an image with QR code content into text.
    /// - Returns: Transformed text.
    func parseQR() -> String? {
        guard let image = CIImage(image: self),
              let detector = CIDetector(ofType: CIDetectorTypeQRCode,
                                        context: nil,
                                        options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]) else { return nil }
        
        let parsedContent = detector
            .features(in: image)
            .compactMap { $0 as? CIQRCodeFeature }
            .compactMap { $0.messageString }
            .joined()
        return parsedContent.isEmpty ? nil : parsedContent
    }
    
}
