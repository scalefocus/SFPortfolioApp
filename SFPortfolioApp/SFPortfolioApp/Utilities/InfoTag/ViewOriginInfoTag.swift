//
//  ViewOriginInfoTag.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 6.08.21.
//

import UIKit

/// Enum defining possible view origin types.
enum ViewOriginInfoTag {
    
    case uiKit
    case swiftUI
    
}

// MARK: - InfoTagProtocol
extension ViewOriginInfoTag: InfoTagProtocol {
    
    var title: String {
        switch self {
        case .uiKit:
            return Constants.General.uiKitViewOriginTagTitle
        case .swiftUI:
            return Constants.General.swiftUIViewOriginTagTitle
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .uiKit:
            return .uiKitInfoTagBackground
        case .swiftUI:
            return .swiftUIInfoTagBackground
        }
    }
    
}
