//
//  UIView+Shadowed.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 14.07.21.
//

import UIKit

extension UIView {
    
    /// Generates a shadow to the view.
    /// - Parameters:
    ///   - color: Color of the shadow.
    ///   - radius: How wide the shadow should be.
    ///   - opacity: How transparent the shadow is.
    ///   - offset: How far away from the view the shadow should be.
    func shadowed(color: UIColor = .shadow,
                  radius: CGFloat = Constants.defaultShadowRadius,
                  opacity: Float = Constants.defaultShadowOpacity,
                  offset: CGSize = Constants.defaultShadowOffset) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
    
}
