//
//  CategoryItemsViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

/// Protocol defining functionality of a view model.
protocol CategoryItemsViewModelProtocol: CoordinatableViewModel, BaseDataSource {
    
    /// Request finish scene with category item selected.
    /// - Parameter indexPath: Index of the selected item in collection.
    func selectItem(at index: Int)
    
}
