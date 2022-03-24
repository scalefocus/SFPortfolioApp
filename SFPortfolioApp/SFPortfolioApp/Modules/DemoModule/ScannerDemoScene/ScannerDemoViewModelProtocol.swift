//
//  ScannerDemoViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 28.10.21.
//

import SFBaseKit

protocol ScannerDemoViewModelProtocol: CoordinatableViewModel, ScannnerViewModelDelegate {
    
    /// Title to configure the view with.
    var title: String { get }
    
    /// Observable information text.
    var infoText: Observable<String?> { get }
    
}
