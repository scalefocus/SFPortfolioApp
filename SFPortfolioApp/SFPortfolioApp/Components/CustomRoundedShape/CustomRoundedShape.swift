//
//  CustomRoundedShape.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

/// `CustomRoundedShape` implementation of `Shape` which allows us rounding only specific corners.
struct CustomRoundedShape: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}
