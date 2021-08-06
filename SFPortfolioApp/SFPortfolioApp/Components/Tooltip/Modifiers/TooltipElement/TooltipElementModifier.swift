//
//  TooltipElementModifier.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

/// A view modifier used for applying on child views where a `Tooltip` is needed to be shown.
///
/// - Warning: This modifier won't produce any result if used by itself alone.
/// It just notifies its screen container (if there is such subscribed by `TooltipApplicableModifier`) that
/// a `Tooltip` should be shown at some point for this specific child view.
///
/// - Note: There is a view extension provided for convenient usage.
///
/// - Example:
/// ```
/// ContainerView {
///     ElementView()
///         .tooltipElement(handler: handler, identity: "TextKey")
/// }
/// .tooltipApplicable(handler: handler, config: config)
/// ```
struct TooltipElementModifier<T: TooltipHandlerProtocol>: ViewModifier {
    
    @ObservedObject var handler: T
    let tooltipIdentity: TooltipIdentity
    
    func body(content: Content) -> some View {
        content
            .if(tooltipIdentity == handler.shownTooltip?.identity) {
                $0.anchorPreference(key: TooltipBoundsPreferenceKey.self, value: .bounds) { [$0] }
            }
    }
    
}
