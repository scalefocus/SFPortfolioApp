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
    let numberOfColumnsInPortrait: Int?
    
    /// Cells padding ratio based on the cell width.
    let cellPaddingRatio: CGFloat?
    
    /// Vertical offset ratio based on the cell height.
    let verticalOffsetRatio: CGFloat?
    
    /// Cell height ratio based on the cell width.
    let cellHeightRatio: CGFloat?
    
}
