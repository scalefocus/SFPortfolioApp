//
//  ExecutionButtonConfig.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

/// Model defining a base configuration for execution button appearance.
///
/// - NOTE: Each configuration property fallbacks to a default value in case it's not configured.
struct ExecutionButtonConfig {
    
    // Main appearance
    let imageName: String
    var font: Font = .custom(size: 18)
    var triggerPercentage: Double = 0.8
    var arrowAnimationPercentageTrigger: Double = 0.7
    var outerCornerRadius: CGFloat = 36
    
    // Text foreground color
    var defaultTextForegroundColor: Color = .white
    var disabledTextForegroundColor: Color = .white
    
    // Background fill color
    var defaultBackgroundFillColor: Color = .black
    var disabledBackgroundFillColor: Color = .gray
    
    // Background shadow color
    var defaultBackgroundShadowColor: Color = .gray
    var disabledBackgroundShadowColor: Color = .gray
    
    // Arrow slider multiply color
    var defaultArrowSliderMultiplyColor: Color = .white
    var disabledArrowSliderMultiplyColor: Color = .gray
    
    // Gradient fill colors
    var gradientFillColors: [Color] = []
    
    // Loading spinner
    var loadingSpinnerLineWidth: CGFloat = 3
    var loadingSpinnerLineColor: Color = .white
    var loadingSpinnerAnimationDuration: Double = 0.6
    
}
