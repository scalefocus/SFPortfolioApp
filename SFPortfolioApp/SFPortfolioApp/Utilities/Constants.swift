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
        
        /// Duration of the `SplashScene` in seconds.
        static let splashDuration: CGFloat = 2
        
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
        static let collectionViews = "Collection Views"
        
        /// Title of `Modal Views` category, containing different modal view elements.
        static let modalViews = "Modal Views"
        
        /// Title of `Buttons` category, containing different button elements.
        static let buttons = "Buttons"
        
        /// Title of `Popover Views` category, containing different popover view elements.
        static let popoverViews = "Popover Views"
        
        /// Title of `Tab Views` category, containing different tab view elements.
        static let tabViews = "Tab Views"
        
        /// Title of `Loading Views` category, containing different loading view elements.
        static let loadingViews = "Loading Views"
        
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
        
        /// Title of `Execution Button` category item.
        static let executionButton = "Execution Button"
        
        /// Title of `Custom Segmented Control View` category item.
        static let customSegmentedControl = "Custom Segmented Control"
        
        /// Title of `Shimmer Loading View` category item.
        static let shimmerLoadingView = "Shimmer Loading View"
        
    }
    
    // MARK: - Identifier
    struct Identifier {
        
        // MARK: - CategoryModule
        static let listTableView = "listTableView"
        static let listTableViewBackground = "listTableViewBackground"
        static let logo = "logo"
        static let tagsStackView = "tagsStackView"
        
        // MARK: - AssymetricCollectionDemoScene
        static let settingsButton = "settings"
        static let asymmetricDemoCollectionView = "asymmetricCollectionView"
        static let asymmetricDemoPlayer = "asymmetricDemoPlayer"
        static let asymmetricDemoBackground = "asymmetricDemoBackground"
        static let asymmetricDemoEnemy = "asymmetricDemoEnemy"
        static let asymmetricDemoCollectionViewCell = "asymmetricCollectionViewCell"
        
        // MARK: - AssymetricCollectionSettingsScene
        static let asymmetricSettingsView = "asymmetricSettingsView"
        static let asymmetricSettingsContainerView = "containerView"
        static let asymmetricSettingsNumberOfCellsLabel = "numberOfCellsLabel"
        static let asymmetricSettingsNumberOfCellsSlider = "numberOfCellsSlider"
        static let asymmetricSettingsCellPaddingLabel = "cellPaddingLabel"
        static let asymmetricSettingsCellPaddingSlider = "cellPaddingSlider"
        static let asymmetricSettingsSizeRatioLabel = "sizeRatioLabel"
        static let asymmetricSettingsSizeRatioSlider = "sizeRatioSlider"
        static let asymmetricSettingsOffsetLabel = "offsetLabel"
        static let asymmetricSettingsOffsetSlider = "offsetSlider"
        
    }
    
}
