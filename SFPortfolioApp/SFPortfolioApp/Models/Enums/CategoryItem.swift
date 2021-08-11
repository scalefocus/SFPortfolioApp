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
    case bottomSheet
    case tooltipView
    
}

// MARK: - Properties
extension CategoryItem {
    
    var title: String {
        switch self {
        case .synchronisedCollectionView:
            return Constants.CategoryItemTitle.synchronisedCollectionView
        case .asymmetricCollectionView:
            return Constants.CategoryItemTitle.asymmetricCollectionView
        case .bottomSheet:
            return Constants.CategoryItemTitle.bottomSheet
        case .tooltipView:
            return Constants.CategoryItemTitle.tooltipView
        }
    }
    
    var tags: [InfoTagProtocol] {
        [viewOriginTag]
    }
    
    // MARK: - Private properties
    private var viewOriginTag: ViewOriginInfoTag {
        switch self {
        case .synchronisedCollectionView, .asymmetricCollectionView:
            return .uiKit
        case .bottomSheet, .tooltipView:
            return .swiftUI
        }
    }
    
}
