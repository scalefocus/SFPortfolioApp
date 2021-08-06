//
//  UIColor+CustomColors.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 13.07.21.
//

import UIKit

extension UIColor {
    
    /// Navigation bar tint color.
    static let barTint = UIColor(named: "barTint") ?? UIColor()
    
    /// Base color for cells background.
    static let baseCell = UIColor(named: "baseCell") ?? UIColor()
    
    /// Color of the shadows.
    static let shadow = UIColor(named: "shadow") ?? UIColor()
    
    /// Navigation bar background color.
    static let barBackground = UIColor(named: "barBackground") ?? UIColor()
    
    /// UIKit view origin info tag background.
    static let uiKitInfoTagBackground = UIColor(named: "uiKitTagBackground") ?? UIColor()
    
    /// SwiftUI view origin info tag background.
    static let swiftUIInfoTagBackground = UIColor(named: "swiftUITagBackground") ?? UIColor()
    
}
