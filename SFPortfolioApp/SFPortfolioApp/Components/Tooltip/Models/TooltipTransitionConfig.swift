//
//  TooltipTransitionConfig.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 3.08.21.
//

import SwiftUI

/// Model defining base configuration for tooltip transition.
/// 
/// - NOTE: Each configuration property fallbacks to a default value in case it's not configured.
struct TooltipTransitionConfig {
    
    var withTransition: Bool = false
    var transitionYOffset: CGFloat = 8
    var transitionDelayTime: Double = 0.2
    var transitionOffsetDuration: Double = 0.15
    var transitionOpacityDuration: Double = 0.075
    var transitionOpacityDelay: Double = 0.075
    
    var animationDelay: Double {
        transitionDelayTime + transitionOffsetDuration
    }
    
}
