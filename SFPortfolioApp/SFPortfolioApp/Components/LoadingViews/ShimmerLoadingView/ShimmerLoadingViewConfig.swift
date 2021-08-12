//
//  ShimmerLoadingViewConfig.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 12.08.21.
//

import SwiftUI

/// Model defining a base configuration for shimmer loading view appearance.
struct ShimmerLoadingViewConfig {
    
    let height: CGFloat
    let gradientColors: [Color]
    var cornerRadius: CGFloat = 16
    var animationDuration: Double = 1
    var autoreverses = false
    
}
