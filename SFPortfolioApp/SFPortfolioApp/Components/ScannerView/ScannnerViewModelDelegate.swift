//
//  ScannnerViewModelDelegate.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 27.10.21.
//

import UIKit

protocol ScannnerViewModelDelegate: AnyObject {
    
    /// Notifies thet an image is scanned.
    /// - Parameter image: Scanned image.
    /// - Parameter scanType: Type of scanned content.
    func didFinishScan(_ image: UIImage, scanType: ScanType)

}
