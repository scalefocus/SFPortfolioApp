//
//  PieProgressIndicatorConfig.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 29.09.21.
//

import SwiftUI

/// Model defining a base configuration for `PieProgressIndicatorView` appearance.
///
/// - NOTE: Each configuration property fallbacks to a default value in case it's not configured.
struct PieProgressIndicatorConfig {
    
    /// Loading overlay oppacity.
    let opacity: Double = 0.7
    
    /// Padding between pie outline border and nearest border of the content view.
    let piePadding: CGFloat = 7
    
    /// Border width of the hole shape mask.
    let pieOutlineBorderWidth: CGFloat = 5
    
    /// Loading overlay color.
    let color: Color = .black
    
}
