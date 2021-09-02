//
//  AsymmetricCollectionViewCell.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.08.21.
//

import UIKit

class AsymmetricCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var enemyImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        accessibilityIdentifier = Constants.Identifier.asymmetricDemoCollectionViewCell
        enemyImageView.accessibilityIdentifier = Constants.Identifier.asymmetricDemoEnemy
    }
    
}
