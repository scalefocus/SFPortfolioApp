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
    let tags: [InfoTagProtocol]
    
    // MARK: - Init
    init(title: String, tags: [InfoTagProtocol] = []) {
        self.title = title
        self.tags = tags
    }
    
}
