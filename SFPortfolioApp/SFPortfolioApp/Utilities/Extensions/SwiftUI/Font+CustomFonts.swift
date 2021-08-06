//
//  Font+CustomFonts.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

extension Font {
    
    /// Generates a custom `Font` based on a custom font type and size.
    static func custom(type: CustomFont = .primary, size: CGFloat) -> Font {
        .custom(type.name, size: size)
    }
    
}
