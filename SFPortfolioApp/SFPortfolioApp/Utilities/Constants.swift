//
//  Constants.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 20.07.21.
//

import UIKit

struct Constants {
    
    /// The total duration of cell animations in the application.
    static let cellAnimationDuration: TimeInterval = 0.5
    
    /// The amount of time to wait before beginning cell animations in the application.
    static let cellAnimationDelay: TimeInterval = 0.05
    
    /// How transparent shadows in the application should be.
    static let defaultShadowOpacity: Float = 0.3
    
    /// How wide shadows  in the application should be.
    static let defaultShadowRadius: CGFloat = 5
    
    /// How far away from the view shadows in the application should be.
    static let defaultShadowOffset: CGSize = CGSize(width: 0, height: 0)
    
    /// Default edge insets of table view cells when device is in portrait orientation.
    static let portraitCellInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    /// Default edge insets of table view cells when device is in landscape orientation.
    static let landscapeCellInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 96, bottom: 0, right: 96)
}
