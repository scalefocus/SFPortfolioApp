//
//  CategoryTableViewCell.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import SFBaseKit

class CategoryTableViewCell: UIResizebleTableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var categoryName: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Public Functions
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.shadowed()
    }
    
}

// MARK: - Configurable
extension CategoryTableViewCell: Configurable {
    
    func configureWith(_ data: CategoryTableViewCellViewModelProtocol) {
        categoryName.text = data.categoryName
    }
    
}
