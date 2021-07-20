//
//  CategoryItemsViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

/// Protocol defining functionality of a view model.
protocol CategoryItemsViewModelProtocol: CoordinatableViewModel, BaseDataSource {
    
    /// Category title of the items.
    var title: String { get }
    
    /// Request finish scene with category item selected.
    /// - Parameter index: Index of the selected item in collection.
    func selectItem(at index: Int)
    
}
