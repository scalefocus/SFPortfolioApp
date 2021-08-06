//
//  ArrowShape.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

/// `ArrowShape` implementation of `Shape` used for drawing the arrow part within `Tooltip` view.
struct ArrowShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addLines([
            CGPoint(x: 0, y: rect.height),
            CGPoint(x: rect.width / 2, y: 0),
            CGPoint(x: rect.width, y: rect.height)
        ])
        return path
    }
    
}

/// `ExtendedArrowShape` implementation of `Shape` used for background and clip shape of `ArrowShape` within `Tooltip` view.
struct ExtendedArrowShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addLines([
            CGPoint(x: 0, y: rect.height + 2),
            CGPoint(x: 0, y: rect.height),
            CGPoint(x: rect.width / 2, y: 0),
            CGPoint(x: rect.width, y: rect.height),
            CGPoint(x: rect.width, y: rect.height + 2)
        ])
        return path
    }
    
}
