//
//  CustomFont.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import Foundation

/// Enum defining possible custom font types.
enum CustomFont: String {
    case primary
    
    var name: String {
        switch self {
        case .primary:
            return Constants.General.primaryFontName
        }
    }
}
