//
//  AsymmetricCollectionViewLayoutConfigurator.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 7.07.21.
//

import UIKit

struct AsymmetricCollectionViewLayoutConfigurator {
    
    /// Number of columns with cells in portrait mode.
    /// - Warning: Number of columns in landscape mode is automatically
    /// calculated according to the cell size being the same in portrait and landscape.
    /// - Note: Value will be constrained in an iterval form 0 to 20. If wished value is
    /// outside the bounds of the interval the value of nearest from upper/lower bound will be used.
    @Constrained(0...20)
    var numberOfColumnsInPortrait = 5
    
    /// Cells padding ratio based on the cell width.
    /// - Note: Value will be constrained in an iterval form 0 to 0.25. If wished value is
    /// outside the bounds of the interval the vale of nearest from upper/lower bound will be used.
    @Constrained(0...0.25)
    var cellPaddingRatio: CGFloat = 0
    
    /// Vertical offset ratio based on the cell height.
    /// - Note: Value will be constrained in an iterval form 0 to 2. If wished value is
    /// outside the bounds of the interval the value of nearest from upper/lower bound will be used.
    @Constrained(0...2)
    var verticalOffsetRatio: CGFloat = 0
    
    /// Cell height ratio based on the cell width.
    /// - Note: Value will be constrained in an iterval form 0.1 to 2. If wished value is
    /// outside the bounds of the interval the value of nearest from upper/lower bound will be used.
    @Constrained(0.1...2)
    var cellHeightRatio: CGFloat = 1
    
}
