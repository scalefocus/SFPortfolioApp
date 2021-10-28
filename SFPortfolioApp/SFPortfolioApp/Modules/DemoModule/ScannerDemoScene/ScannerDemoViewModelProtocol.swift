//
//  ScannerDemoViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 28.10.21.
//

import SFBaseKit

protocol ScannerDemoViewModelProtocol: CoordinatableViewModel {
    
    /// Title to configure the view with.
    var title: String { get }
    
    /// Observable information text.
    var infoText: Observable<String?> { get }
    
    /// Performs image scan.
    /// - Parameter image: Image to scan.
    func scan(_ image: UIImage, scanType: ScanType)
    
}
