//
//  UINavigationController+Appearance.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 20.07.21.
//

import UIKit

extension UINavigationController {
    
    /// Configure navigation bar tint and title appearance.
    func setupNavigationBarAppearance() {
        navigationBar.tintColor = .barTint
        navigationBar.backgroundColor = .barBackground
        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.barTint]
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.barTint]
        navigationBar.blurred()
    }
    
}
