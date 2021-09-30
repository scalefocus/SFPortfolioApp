//
//  Category.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import Foundation

/// Enum defining possible portfolio categories.
enum Category: CaseIterable {
    
    case collectionViews
    case modalViews
    case popoverViews
    case buttons
    case tabViews
    case loadingViews
    
}

// MARK: - Properties
extension Category {
    
    var title: String {
        switch self {
        case .collectionViews:
            return Constants.CategoryTitle.collectionViews
        case .modalViews:
            return Constants.CategoryTitle.modalViews
        case .popoverViews:
            return Constants.CategoryTitle.popoverViews
        case .buttons:
            return Constants.CategoryTitle.buttons
        case .tabViews:
            return Constants.CategoryTitle.tabViews
        case .loadingViews:
            return Constants.CategoryTitle.loadingViews
        }
    }
    
    var categoryItems: [CategoryItem] {
        switch self {
        case .collectionViews:
            return [
                .asymmetricCollectionView,
                .synchronisedCollectionView
            ]
        case .modalViews:
            return [
                .bottomSheet
            ]
        case .popoverViews:
            return [
                .tooltipView
            ]
        case .buttons:
            return [
                .executionButton
            ]
        case .tabViews:
            return [
                .customSegmentedControl
            ]
        case .loadingViews:
            return [
                .shimmerLoadingView,
                .pieProgressIndicator
            ]
        }
    }
    
}
