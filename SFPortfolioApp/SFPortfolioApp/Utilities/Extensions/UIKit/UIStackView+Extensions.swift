//
//  UIStackView+Extensions.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 9.09.21.
//

import UIKit

extension UIStackView {
    
    /// Removes arranged subview.
    /// - Parameter view: `UIView` to remove.
    func remove(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    /// Removes all arranged subviews.
    func removeArrangedSubviews() {
        arrangedSubviews.forEach { remove(view: $0) }
    }
    
}
