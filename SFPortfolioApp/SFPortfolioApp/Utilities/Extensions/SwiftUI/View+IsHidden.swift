//
//  View+IsHidden.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

extension View {
    
    /// View extension function providing more convenient usage of view hiding functionality by directly passing a condition.
    /// Executes native `hidden()` when the given `isHidden` condition is fulfilled. Otherwise - just returns the same original view.
    ///
    /// - Parameter isHidden: The condition to evaluate.
    /// - Returns: Either the original `View` or the modified hidden `View` if the condition is `true`.
    ///
    /// - NOTE: `hidden` differs from `show` where the view is hidden and **NOT** added to the view hierarchy.
    /// You can use `hidden` in case you want your view to be hidden and still added in the view hierarchy.
    func hidden(if isHidden: Bool) -> some View {
        isHidden ? hidden().anyView : anyView
    }
    
}
