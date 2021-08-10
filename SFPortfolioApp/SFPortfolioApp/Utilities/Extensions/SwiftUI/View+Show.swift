//
//  View+Show.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

extension View {
    
    /// View extension function providing easier usage for conditional showing
    /// of a view which can be attached directly within the view modifier chain.
    ///
    /// - Parameter condition: Bool condition defining whether the view should be shown of not.
    /// - Returns: The same unmodified view in case the condition is fulfilled.
    ///
    /// - NOTE: `show` differs from `hidden` where the view is added to the view hierarchy and is just hidden.
    /// You can use `show` in case you want your view to be hidden and not added in the view hierarchy at all.
    @ViewBuilder func show(if condition: Bool) -> some View {
        if condition { self }
    }
    
}
