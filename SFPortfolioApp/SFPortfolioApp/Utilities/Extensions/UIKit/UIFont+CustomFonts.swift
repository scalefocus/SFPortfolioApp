//
//  UIFont+CustomFonts.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 15.07.21.
//

import UIKit

extension UIFont {
    
    /// Generates a custom `UIFont` based on a custom font type and size.
    static func custom(type: CustomFont = .primary, size: CGFloat) -> UIFont {
        UIFont(name: type.name, size: size) ?? UIFont()
    }
    
}
