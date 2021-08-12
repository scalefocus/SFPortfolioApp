//
//  SynchronisedCollectionViewsViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 6.07.21.
//

import SFBaseKit

protocol SynchronisedCollectionViewsViewModelProtocol: CoordinatableViewModel, BaseDataSource {
    
    var title: String { get }
    
    var iconsCollection: [SyncronisedCollectionViewMockIcons] { get }
    
    func viewConfigurator(at index: Int, in section: Int, for collectionView: String) -> ViewConfigurator?
    
}
