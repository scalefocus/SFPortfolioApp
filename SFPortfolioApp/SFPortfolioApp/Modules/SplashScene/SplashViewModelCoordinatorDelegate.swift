//
//  SplashViewModelCoordinatorDelegate.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 26.08.21.
//

import Foundation

protocol SplashViewModelCoordinatorDelegate: AnyObject {
    
    /// Navigate to `CategoryListScene`.
    func didFinishSplashScene()
    
}
