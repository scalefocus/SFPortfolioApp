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
    case executionButton
    case tooltipView
    case customSegmentedControl
    case shimmerLoadingView
    case pieProgressIndicator
    case magicSliderView
    case scannerView
    
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
        case .executionButton:
            return Constants.CategoryItemTitle.executionButton
        case .tooltipView:
            return Constants.CategoryItemTitle.tooltipView
        case .customSegmentedControl:
            return Constants.CategoryItemTitle.customSegmentedControl
        case .shimmerLoadingView:
            return Constants.CategoryItemTitle.shimmerLoadingView
        case .pieProgressIndicator:
            return Constants.CategoryItemTitle.pieProgressIndicator
        case .magicSliderView:
            return Constants.CategoryItemTitle.magicSliderView
        case .scannerView:
            return Constants.CategoryItemTitle.scannerView
        }
    }
    
    var tags: [InfoTagProtocol] {
        [viewOriginTag]
    }
    
    // MARK: - Private properties
    private var viewOriginTag: ViewOriginInfoTag {
        switch self {
        case .synchronisedCollectionView,
             .asymmetricCollectionView,
             .scannerView:
            return .uiKit
        case .bottomSheet,
             .tooltipView,
             .executionButton,
             .customSegmentedControl,
             .shimmerLoadingView,
             .pieProgressIndicator,
             .magicSliderView:
            return .swiftUI
        }
    }
    
}
