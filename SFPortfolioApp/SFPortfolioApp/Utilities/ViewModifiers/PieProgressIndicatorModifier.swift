//
//  PieProgressIndicatorModifier.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 29.09.21.
//

import SwiftUI

/// A view modifier used for attaching a `PieProgressIndicator` to a specific view.
struct PieProgressIndicatorModifier<T: PieProgressIndicatorViewModelProtocol>: ViewModifier {
    
    // MARK: - Properties
    @ObservedObject var viewModel: T
    let config: PieProgressIndicatorConfig
    
    // MARK: - Main View
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { PieProgressIndicatorView(viewModel: viewModel,
                                                          config: config,
                                                          width: $0.size.width,
                                                          height: $0.size.height) }
            )
    }
    
}
