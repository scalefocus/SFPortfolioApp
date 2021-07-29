//
//  CategoryItemTableViewCellViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import Foundation

class CategoryItemTableViewCellViewModel: CategoryItemTableViewCellViewModelProtocol {
    
    // MARK: - Properties
    let title: String
    let cellType: CategoryCellType
    
    // MARK: - Initializers
    init(title: String, cellType: CategoryCellType) {
        self.title = title
        self.cellType = cellType
    }
    
}
