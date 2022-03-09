//
//  ScannerDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 28.10.21.
//

import SFBaseKit

class ScannerDemoViewModel: ScannerDemoViewModelProtocol {
    
    // MARK: - Properties
    let infoText = Observable<String?>(nil)
    var title: String {
        CategoryItem.scannerView.title
    }
    
}

// MARK: - ScannerViewModelDelegate
extension ScannerDemoViewModel {
    
    func didFinishScan(text: String?) {
        infoText.value = text
    }
    
}
