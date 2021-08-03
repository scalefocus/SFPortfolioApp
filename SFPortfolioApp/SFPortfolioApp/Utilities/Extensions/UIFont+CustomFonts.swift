//
//  UIFont+CustomFonts.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 15.07.21.
//

import UIKit

extension UIFont {
    
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
    
    /// Generates a custom `UIFont` based on a custom font type and size.
    static func custom(type: CustomFont = .primary, size: CGFloat) -> UIFont {
        UIFont(name: type.name, size: size) ?? UIFont()
    }
    
}
