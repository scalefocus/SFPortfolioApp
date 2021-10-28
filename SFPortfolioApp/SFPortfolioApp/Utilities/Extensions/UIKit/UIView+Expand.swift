//
//  UIView+Expand.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 27.10.21.
//

import UIKit

extension UIView {
    
    /// Expanding a view to a parentView fitting with it's constraints.
    func expand(in parentView: UIView) {
        parentView.addSubview(self)
        activateConstraints(to: parentView)
    }
    
    private func activateConstraints(to parentView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        widthAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: parentView.heightAnchor).isActive = true
    }
    
}
