//
//  TooltipDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import Foundation

class TooltipDemoViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var handler = TooltipHandler()
    let title = Constants.CategoryItemTitle.tooltipView
    
    // MARK: - Public Functions
    func onActivateButtonTap(identity: TooltipIdentity) {
        let tooltip = tooltip(position: identity == .primary ? .top : .bottom,
                              identity: identity)
        handler.showTooltip(tooltip)
    }
    
    // MARK: - Private Functions
    private func tooltip(position: Tooltip.Position,
                         identity: TooltipIdentity) -> Tooltip {
        Tooltip(identity: identity,
                position: position,
                text: "This is an information tooltip!",
                leadingImageName: "info")
    }
    
}
