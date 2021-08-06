//
//  InfoTagProtocol.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 6.08.21.
//

import UIKit

/// Protocol defining functionality and base needed information for an info tag displayed within a category item.
protocol InfoTagProtocol {
    
    /// Info tag's title.
    var title: String { get }
    
    /// Info tag's background color.
    var backgroundColor: UIColor { get }
    
}
