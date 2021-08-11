//
//  Constants.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 20.07.21.
//

import UIKit

struct Constants {
    
    // MARK: - General
    struct General {
        
        /// Title of the application.
        static let appTitle = "SFPortfolioApp"
        
        /// Font name of the primary used font.
        static let primaryFontName = "OpenSans-Regular"
        
        /// Default font size.
        static let defaultFontSize: CGFloat = 20
        
        /// Defines default shadow opacity.
        static let defaultShadowOpacity: Float = 0.2
        
        /// Defines default shadow radius.
        static let defaultShadowRadius: CGFloat = 5
        
        /// Defines default shadow offset.
        static let defaultShadowOffset: CGSize = CGSize(width: 0, height: 0)
        
        /// UIKit view origin info tag title.
        static let uiKitViewOriginTagTitle = "UIKit"
        
        /// SwiftUI view origin info tag title.
        static let swiftUIViewOriginTagTitle = "SwiftUI"
        
        /// Defines default edge insets for tag labels.
        static let tagInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
        
        /// Default font size for tag labels.
        static let tagFontSize: CGFloat = 15
        
        /// Minimum scale factor for the text of the tag label.
        static let tagTextMinimumScaleFactor: CGFloat = 4
        
        /// Defines default navigation bar height.
        static let navigationBarHeight: CGFloat = 72
        
    }
    
    // MARK: - CategoryList
    struct CategoryList {
        
        /// Category list scene title.
        static let title = "Categories"
        
        /// The total duration of cell animations in the application.
        static let cellAnimationDuration: TimeInterval = 0.5
        
        /// The amount of time to wait before beginning cell animations in the application.
        static let cellAnimationDelay: TimeInterval = 0.05
        
    }
    
    // MARK: - CategoryTitle
    struct CategoryTitle {
        
        /// Title of `Collection Views` category, containing different collection view elements.
        static let collectionView = "Collection Views"
        
        /// Title of `Modal Views` category, containing different modal view elements.
        static let modalView = "Modal Views"
        
        /// Title of `Popover Views` category, containing different popover view elements.
        static let popoverView = "Popover Views"
        
    }
    
    // MARK: - CategoryItemTitle
    struct CategoryItemTitle {
        
        /// Title of `Synchronised Collection View` category item.
        static let synchronisedCollectionView = "Synchronised Collection View"
        
        /// Title of `Asymmetric Collection View` category item.
        static let asymmetricCollectionView = "Asymmetric Collection View"
        
        /// Title of `Bottom Sheet View` category item.
        static let bottomSheet = "Bottom Sheet"
        
        /// Title of `Tooltip View` category item.
        static let tooltipView = "Tooltip View"
        
    }
    
}
