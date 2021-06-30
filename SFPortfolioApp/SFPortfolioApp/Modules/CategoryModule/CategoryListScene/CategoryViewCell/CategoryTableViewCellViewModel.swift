//
//  CategoryTableViewCellViewModel.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 1.07.21.
//

import Foundation

class CategoryTableViewCellViewModel: CategoryTableViewCellViewModelProtocol {
    
    // MARK: - Public Properties
    let categoryName: String
    
    // MARK: - Initializers
    init(_ categoryName: String) {
        self.categoryName = categoryName
    }
    
}
