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
    let title: String
    let iconsCollection: [SyncronisedCollectionViewMockIcons]
    
    // MARK: - Init
    init(title: String, iconsCollection: [SyncronisedCollectionViewMockIcons]) {
        self.title = title
        self.iconsCollection = iconsCollection
    }
    
    // MARK: - Public Functions
    func numberOfCellsInSection(_ section: Int) -> Int? {
        iconsCollection.count
    }
    
    func viewConfigurator(at index: Int, in section: Int, for collectionView: String) -> ViewConfigurator? {
        guard let collectionViewType = SynchronisedCollectionViews(rawValue: collectionView) else { return nil }
        
        switch collectionViewType {
        case .barCollectionView:
            return iconsCollectionViewConfigurator(at: index)
        case .detailsCollectionView:
            return detailsCollectionViewConfigurator(at: index)
        }
    }
    
    // MARK: - Private Functions
    private func iconsCollectionViewConfigurator(at index: Int) -> ViewConfigurator? {
        guard let iconImage = iconsCollection[safeAt: index]?.image,
              let iconLabel = iconsCollection[safeAt: index]?.text else { return nil }
        
        let tabBarCollectionViewCellViewModel = TabBarCollectionViewCellViewModel(iconImage, iconLabel)
        return TabBarCollectionViewConfigurator(data: tabBarCollectionViewCellViewModel)
    }
    
    private func detailsCollectionViewConfigurator(at index: Int) -> ViewConfigurator? {
        guard let textLabel = iconsCollection[safeAt: index]?.text else { return nil }
        
        let detailsCollectionViewCellViewModel = DetailsCollectionViewCellViewModel(textLabel)
        return DetailsCollectionViewConfigurator(data: detailsCollectionViewCellViewModel)
    }
    
}
