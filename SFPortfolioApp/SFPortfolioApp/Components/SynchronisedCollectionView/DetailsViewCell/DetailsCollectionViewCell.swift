//
//  DetailsCollectionViewCell.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 7.07.21.
//

import SFBaseKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var detailsTextLabel: UILabel!
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAccessibility()
    }
    
    // MARK: - Private Functions
    private func setupAccessibility() {
        accessibilityIdentifier = Constants.Identifier.detailsCell
        detailsTextLabel.accessibilityIdentifier = Constants.Identifier.detailsCellLabel
    }
    
}

// MARK: - Configurable
extension DetailsCollectionViewCell: Configurable {
    
    func configureWith(_ data: DetailsCollectionViewCellViewModelProtocol) {
        detailsTextLabel.text = data.detailsTextLabel
    }
    
}
