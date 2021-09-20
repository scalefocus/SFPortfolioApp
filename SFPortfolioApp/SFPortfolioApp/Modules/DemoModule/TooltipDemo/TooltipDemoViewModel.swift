//
//  TooltipDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import Foundation

class TooltipDemoViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var primaryHandler = TooltipHandler()
    @Published var secondaryHandler = TooltipHandler()
    let title = Constants.CategoryItemTitle.tooltipView
    
    // MARK: - Public Functions
    func onActivateButtonTap(identity: TooltipIdentity) {
        switch identity {
        case .primary:
            let tooltip = tooltip(position: .top, identity: identity)
            primaryHandler.showTooltip(tooltip)
        case .secondary:
            let tooltip = tooltip(position: .bottom, identity: identity)
            secondaryHandler.showTooltip(tooltip)
        }
    }
    
    // MARK: - Private Functions
    private func tooltip(position: Tooltip.Position, identity: TooltipIdentity) -> Tooltip {
        Tooltip(identity: identity,
                position: position,
                text: "This is an information tooltip!",
                leadingImageName: "info")
    }
    
}
