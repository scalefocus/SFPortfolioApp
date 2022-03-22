//
//  ScannnerViewModelDelegate.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 27.10.21.
//

import UIKit

protocol ScannnerViewModelDelegate: AnyObject {
    
    /// Notifies that an image is scanned.
    /// - Parameter text: Scanned text or nil if scan did fail.
    func didFinishScan(text: String?)

}
