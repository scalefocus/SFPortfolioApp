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
    case modalView
    case popoverView
    
}

// MARK: - Properties
extension Category {
    
    var title: String {
        switch self {
        case .collectionView:
            return Constants.CategoryTitle.collectionView
        case .modalView:
            return Constants.CategoryTitle.modalView
        case .popoverView:
            return Constants.CategoryTitle.popoverView
        }
    }
    
    var categoryItems: [CategoryItem] {
        switch self {
        case .collectionView:
            return [
                .asymmetricCollectionView,
                .synchronisedCollectionView
            ]
        case .modalView:
            return [
                .bottomSheet
            ]
        case .popoverView:
            return [
                .tooltipView
            ]
        }
    }
    
}
