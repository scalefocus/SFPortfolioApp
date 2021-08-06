//
//  TooltipHandler.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 3.08.21.
//

import Foundation

/// Protocol defining functionality for handling tooltip messages.
protocol TooltipHandlerProtocol: ObservableObject {
    
    /// The currently shown tooltip (if any). Otherwise - nil.
    var shownTooltip: Tooltip? { get }
    
    /// Shows the given tooltip.
    /// 
    /// - Parameter tooltip: `Tooltip` model to be shown.
    func showTooltip(_ tooltip: Tooltip)
    
    /// Hides the currently shown tooltip (if any).
    func hide()
}

/// Implementation of `TooltipHandlerProtocol`.
class TooltipHandler: TooltipHandlerProtocol {
    
    @Published var shownTooltip: Tooltip?
    
    func showTooltip(_ tooltip: Tooltip) {
        shownTooltip = tooltip
    }
    
    func hide() {
        shownTooltip?.onCloseCompletion?()
        shownTooltip = nil
    }
    
}
