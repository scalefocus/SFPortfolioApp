//
//  MagicSliderConfig.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 2.11.21.
//

import SwiftUI

/// Model defining a base configuration for `MagicSliderView` appearance.
///
/// - NOTE: Each configuration property fallbacks to a default value in case it's not configured.
struct MagicSliderConfig {

    /// `MagicSliderView` orientation.
    var orientation: ViewOrientation = .vertical
    
    /// Width to height ratio.
    var aspectRatio: CGFloat = 3
    
    /// Slider container color.
    var outerColor: Color = .blue
    
    /// Slider container opacity.
    var outerOpacity = 0.15
    
    /// Slider value color.
    var innerColor: Color = .green
    
    /// Progress tag edges padding.
    var tagPadding: CGFloat = 10
    
    /// Progress tag background color.
    var tagBackgroundColor: Color = .white
    
    /// Progress tag info text color.
    var tagForegroundColor: Color = .black
    
    /// Progress tag corner radius.
    var tagCornerRadius: CGFloat = 10
    
    // MARK: - Public Functions
    /// `MagicSliderView` corner radius.
    /// - Parameter size: Slider width.
    /// - Returns: Value of `MagicSliderView` corner radius
    func sliderCornerRadius(size: CGFloat) -> CGFloat {
        size / 10
    }
    
}
