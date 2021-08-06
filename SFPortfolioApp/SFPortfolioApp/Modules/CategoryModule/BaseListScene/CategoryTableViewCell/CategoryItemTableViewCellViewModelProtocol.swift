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
    
    /// Array of info tags to be displayed within the cell.
    var tags: [InfoTagProtocol] { get }
    
}
