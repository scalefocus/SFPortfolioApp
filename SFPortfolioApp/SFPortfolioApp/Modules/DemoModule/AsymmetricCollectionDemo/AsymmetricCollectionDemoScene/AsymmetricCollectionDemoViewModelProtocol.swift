//
//  AsymmetricCollectionDemoViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.08.21.
//

import SFBaseKit

protocol AsymmetricCollectionDemoViewModelProtocol: CoordinatableViewModel, BaseDataSource {
    
    /// Title to configure the view with.
    var title: String { get }
    
    /// Observable layout configurator model.
    var layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator> { get }
    
    /// Request finish scene when settings button is tapped.
    func selectSettings()
    
    /// Request finish scene when back button is tapped.
    func finishScene()
    
}
