//
//  View+TooltipApplicable.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

extension View {
    
    /// View extension function provided for more readable and convenient usage of `TooltipApplicableModifier`.
    ///
    /// - Parameters:
    ///   - handler: `TooltipHandlerProtocol`
    ///   - config: `TooltipTransitionConfig`
    ///   
    /// - Returns: The subscribed to `TooltipApplicableModifier` view.
    func tooltipApplicable<T: TooltipHandlerProtocol>(
        handler: T,
        transitionConfig: TooltipTransitionConfig = TooltipTransitionConfig()
    ) -> some View {
        modifier(TooltipApplicableModifier(handler: handler, transitionConfig: transitionConfig))
    }
    
}
