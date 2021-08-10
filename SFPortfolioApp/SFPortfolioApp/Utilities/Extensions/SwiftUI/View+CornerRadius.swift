//
//  View+CornerRadius.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

extension View {
    
    /// Custom view modifier for rounding only specific corners of a view.
    ///
    /// - Parameters:
    ///   - radius: Corner radius value.
    ///   - corners: The specific corners to be rounded.
    ///   
    /// - Returns: Modified rounded view.
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomRoundedShape(radius: radius, corners: corners))
    }
    
}
