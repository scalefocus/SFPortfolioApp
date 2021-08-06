//
//  TooltipConfig.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 3.08.21.
//

import SwiftUI

/// Model defining base configuration for tooltip appearance.
/// 
/// - NOTE: Each configuration property fallbacks to a default value in case it's not configured.
struct TooltipConfig {
    
    // Main appearance
    var backgroundColor: Color = .white
    var foregroundColor: Color = .blue
    var font: Font = .custom(size: 16)
    
    // Border
    var borderWidth: CGFloat = 1
    var borderRadius: CGFloat = 12
    var borderColor: Color = .blue
    
    // Padding
    var screenPadding: CGFloat = 16
    var contentPaddingLeft: CGFloat = 16
    var contentPaddingRight: CGFloat = 16
    var contentPaddingTop: CGFloat = 24
    var contentPaddingBottom: CGFloat = 24
    
    // Arrow
    var arrowPadding: CGFloat = 10
    var arrowHeight: CGFloat = 12
    var arrowWidth: CGFloat = 24
    
    // Images
    var leadingImageWidth: CGFloat = 24
    var leadingImageHeight: CGFloat = 24
    var trailingImageWidth: CGFloat = 24
    var trailingImageHeight: CGFloat = 24
    
}
