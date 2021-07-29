//
//  CategoryItemTableViewCellViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import Foundation

/// Protocol defining functionality for a call view model.
protocol CategoryItemTableViewCellViewModelProtocol {
    
    /// Title to be set as label.
    var title: String { get }
    
    /// Type of cell depending of which will visualize tag label.
    var cellType: CategoryCellType { get }
    
}
