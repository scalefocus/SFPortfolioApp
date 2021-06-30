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
    
    // MARK: - Initializers
    init(title: String) {
        self.title = title
    }
    
}
