//
//  AsymmetricCollectionDemoViewModelCoordinatorDelegate.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.08.21.
//

import Foundation

protocol AsymmetricCollectionDemoViewModelCoordinatorDelegate: AnyObject {
    
    /// Navigate to Asymmetric collection settings scene.
    func didFinishDemoSceneWithSettingsSelected(configurator: Observable<AsymmetricCollectionViewLayoutConfigurator>)
    
    /// Notifies the demo scene have finished.
    func didFinishAsymmetricCollectionDemoScene()
    
}
