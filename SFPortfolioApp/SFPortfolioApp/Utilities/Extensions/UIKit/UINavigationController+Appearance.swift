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
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = .barBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.barTint]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.barTint]
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.prefersLargeTitles = true
        navigationBar.tintColor = .barTint
        navigationBar.isTranslucent = true
    }
    
}
