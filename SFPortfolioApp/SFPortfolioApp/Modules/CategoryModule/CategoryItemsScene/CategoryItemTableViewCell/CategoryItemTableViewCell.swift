//
//  CategoryItemTableViewCell.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

class CategoryItemTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    
}

// MARK: - Configurable
extension CategoryItemTableViewCell: Configurable {
    
    func configureWith(_ data: CategoryItemTableViewCellViewModelProtocol) {
        titleLabel.text = data.title
    }
    
}

