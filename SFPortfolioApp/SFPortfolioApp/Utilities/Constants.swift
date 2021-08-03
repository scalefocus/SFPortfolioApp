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
        static let defaultShadowOpacity: Float = 0.3
        
        /// Defines default shadow radius.
        static let defaultShadowRadius: CGFloat = 5
        
        /// Defines default shadow offset.
        static let defaultShadowOffset: CGSize = CGSize(width: 0, height: 0)
    }
    
    // MARK: - CategoryList
    struct CategoryList {
        
        /// Category list scene title.
        static let title = "Categories"
        
        /// The total duration of cell animations in the application.
        static let cellAnimationDuration: TimeInterval = 0.5
        
        /// The amount of time to wait before beginning cell animations in the application.
        static let cellAnimationDelay: TimeInterval = 0.05
        
        /// Default edge insets of table view cells when device is in portrait orientation.
        static let portraitCellInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        /// Default edge insets of table view cells when device is in landscape orientation.
        static let landscapeCellInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 96, bottom: 0, right: 96)
    }
    
    // MARK: - CategoryTitle
    struct CategoryTitle {
        
        /// Title of `Collection Views` category, containing different collection view elements.
        static let collectionView = "Collection Views"
    }
    
    // MARK: - CategoryItemTitle
    struct CategoryItemTitle {
        
        /// Title of `Synchronised Collection View` category item.
        static let synchronisedCollectionView = "Synchronised Collection View"
        
        /// Title of `Asymmetric Collection View` category item.
        static let asymmetricCollectionView = "Asymmetric Collection View"
    }
    
}
