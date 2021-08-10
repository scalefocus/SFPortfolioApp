//
//  View+TooltipElement.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

extension View {
    
    /// View extension function provided for more readable and convenient usage of `TooltipElementModifier`.
    ///
    /// - Parameters:
    ///   - handler: `TooltipHandlerProtocol`
    ///   - identity: `TooltipIdentity` value used for identifying and connection between the correct tooltip and the child view where it
    ///   should be applied. Each new identity for a new tooltip can be defined within `TooltipIdentity`.
    ///
    /// - Returns: The subscribed to `TooltipElementModifier` view.
    func tooltipElement<T: TooltipHandlerProtocol>(handler: T, identity: TooltipIdentity) -> some View {
        modifier(TooltipElementModifier(handler: handler, tooltipIdentity: identity)).anyView
    }
    
}
