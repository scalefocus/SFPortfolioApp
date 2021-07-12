//
//  SynchronisedCollectionViewsViewModel.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 6.07.21.
//

import SFBaseKit

class SynchronisedCollectionViewsViewModel: SynchronisedCollectionViewsViewModelProtocol {
    
    typealias TabBarCollectionViewConfigurator = BaseViewConfigurator<TabBarCollectionViewCell>
    typealias DetailsCollectionViewConfigurator = BaseViewConfigurator<DetailsCollectionViewCell>
    
    // MARK: - Public Properties
    let iconsCollection: [SyncronisedCollectionViewMockIcons]
    
    // MARK: - Initializers
    init(iconsCollection: [SyncronisedCollectionViewMockIcons]) {
        self.iconsCollection = iconsCollection
    }
    
    // MARK: - Public Functions
    func numberOfCellsInSection(_ section: Int) -> Int? {
        return iconsCollection.count
    }
    
    func viewConfigurator(at index: Int, in section: Int, for collectionView: String) -> ViewConfigurator? {
        guard let synchronisedCollectionViews = SynchronisedCollectionViews(rawValue: collectionView) else { return nil}
        
        switch synchronisedCollectionViews {
        case SynchronisedCollectionViews.barCollectionView:
            return createConfiguratorForIconsCollectionView(at: index)
        case SynchronisedCollectionViews.detailsCollectionView:
            return createConfiguratorForDetailsCollectionView(at: index)
        }
    }
    
    // MARK: - Private Functions
    private func createConfiguratorForIconsCollectionView(at index: Int) -> ViewConfigurator? {
        guard let iconImage = iconsCollection[safeAt: index]?.image,
              let iconLabel = iconsCollection[safeAt: index]?.text else { return nil }
        
        let tabBarCollectionViewCellViewModel = TabBarCollectionViewCellViewModel(iconImage, iconLabel)
        return TabBarCollectionViewConfigurator(data: tabBarCollectionViewCellViewModel)
    }
    
    private func createConfiguratorForDetailsCollectionView(at index: Int) -> ViewConfigurator? {
        guard let textLabel = iconsCollection[safeAt: index]?.text else { return nil }
        
        let detailsCollectionViewCellViewModel = DetailsCollectionViewCellViewModel(textLabel)
        return DetailsCollectionViewConfigurator(data: detailsCollectionViewCellViewModel)
    }
    
}
