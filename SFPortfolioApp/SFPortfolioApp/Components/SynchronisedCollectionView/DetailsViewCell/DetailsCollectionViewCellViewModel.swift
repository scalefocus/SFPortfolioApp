//
//  DetailsCollectionViewCellViewModel.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 7.07.21.
//

import Foundation

class DetailsCollectionViewCellViewModel: DetailsCollectionViewCellViewModelProtocol {
    
    // MARK: - Public Properties
    let detailsTextLabel: String
    
    // MARK: - Initializers
    init(_ detailsTextLabel: String) {
        self.detailsTextLabel = detailsTextLabel
    }
    
}
