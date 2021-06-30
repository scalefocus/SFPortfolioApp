//
//  CategoryTableViewCell.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import SFBaseKit

class CategoryTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var categoryName: UILabel!
    
}

// MARK: - Configurable
extension CategoryTableViewCell: Configurable {
    
    func configureWith(_ data: CategoryTableViewCellViewModelProtocol) {
        categoryName.text = data.categoryName
    }
    
}
