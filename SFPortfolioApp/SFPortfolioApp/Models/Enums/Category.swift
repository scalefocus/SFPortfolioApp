//
//  Category.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import Foundation

/// Enum defining possible portfolio categories.
enum Category: CaseIterable {
    
    case collectionView
    
}

// MARK: - Properties
extension Category {
    
    var title: String {
        switch self {
        case .collectionView:
            return Constants.CategoryTitle.collectionView
        }
    }
    
    var categoryItems: [CategoryItem] {
        switch self {
        case .collectionView:
            return [
                .asymmetricCollectionView,
                .synchronisedCollectionView
            ]
        }
    }
    
}
