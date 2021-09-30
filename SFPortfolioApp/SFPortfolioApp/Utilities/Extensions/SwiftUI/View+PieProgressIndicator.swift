//
//  View+PieProgressIndicator.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 29.09.21.
//

import SwiftUI

extension View {
    
    /// View extension function provided for more convenient and readable usage of `PieProgressIndicatorModifier`.
    /// - Parameter viewModel: `PieProgressIndicatorViewModel` to be used for configuring the behaviour of the view.
    /// - Parameter config: `PieProgressIndicatorConfig` to be used for configuring the appearance of the view.
    /// - Returns: The modified view with attached loading animation.
    func pieProgressIndicator<T: PieProgressIndicatorViewModelProtocol>(viewModel: T, config: PieProgressIndicatorConfig) -> some View {
        modifier(PieProgressIndicatorModifier(viewModel: viewModel, config: config))
    }
    
}
