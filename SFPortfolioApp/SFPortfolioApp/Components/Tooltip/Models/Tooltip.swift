//
//  Tooltip.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 3.08.21.
//

import Foundation

/// Model defining a base tooltip content.
struct Tooltip {
    
    /// Enum defining possible tooltip positions.
    enum Position {
        case top
        case bottom
    }
    
    let identity: TooltipIdentity
    let position: Position
    let text: String
    let leadingImageName: String
    var trailingImageName: String?
    var config: TooltipConfig = TooltipConfig()
    var onCloseCompletion: (() -> Void)?
    
}
