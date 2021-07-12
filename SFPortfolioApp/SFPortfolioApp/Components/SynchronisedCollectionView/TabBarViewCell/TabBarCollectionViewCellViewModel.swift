//
//  TabBarCollectionViewCellViewModel.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 6.07.21.
//

import SFBaseKit

class TabBarCollectionViewCellViewModel: TabBarCollectionViewCellViewModelProtocol {
    
    // MARK: - Public Properties
    let iconImage: String
    let iconLabel: String
    
    // MARK: - Initializers
    init(_ iconImage: String, _ iconLabel: String) {
        self.iconImage = iconImage
        self.iconLabel = iconLabel
    }

}
