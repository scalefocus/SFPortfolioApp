//
//  UITableViewCell+Extensions.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import UIKit

extension UITableViewCell {
    
    /// A string corresponding to the name of the subclass.
    static var identifier: String {
        return String(describing: self)
    }
    
}
