//
//  CategoryItem.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 1.07.21.
//

import Foundation

/// Enum defining possible category items.
enum CategoryItem: CaseIterable {
    
    case synchronisedCollectionView
    case asymmetricCollectionView
    
    // MARK: - Properties
    var title: String {
        switch self {
        case .synchronisedCollectionView:
            return Constants.CategoryItemTitle.synchronisedCollectionView
        case .asymmetricCollectionView:
            return Constants.CategoryItemTitle.asymmetricCollectionView
        }
    }
    
}
