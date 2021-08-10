//
//  BottomSheetConfig.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

/// Model defining a base configuration for bottom sheet appearance.
///
/// - NOTE: Each configuration property fallbacks to a default value in case it's not configured.
struct BottomSheetConfig {
    
    // Main Appearance
    var defaultItemBackgroundColor: Color = .white
    var selectedItemBackgroundColor: Color = .white
    var dimmedBackgroundOpacity: Double = 0.5
    var animationDuration: Double = 0.2
    var handleHeight: CGFloat = 36
    
    // Header
    var hasHeaderSeparator = true
    var headerHeight: CGFloat = 46
    var headerBackgroundColor: Color = .white
    var headerTitleFont: Font = .custom(size: 14)
    var headerTitleForegroundColor: Color = .black
    var headerSeparatorForegroundColor: Color = .clear
    
    // Drag Indicators
    var dragIndicatorForegroundColor: Color = .gray
    var dragIndicatorWidth: CGFloat = 32
    var dragIndicatorHeight: CGFloat = 4
    var dragIndicatorVerticalPadding: CGFloat = 15
    var dragIndicatorCornerRadius: CGFloat = 12
    
    // Other
    var isFirstItemSelected = false
    var additionalTopPadding: CGFloat = 8
    
}
