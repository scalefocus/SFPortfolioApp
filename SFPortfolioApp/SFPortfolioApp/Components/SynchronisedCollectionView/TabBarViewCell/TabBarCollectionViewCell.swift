//
//  TabBarCollectionViewCell.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 6.07.21.
//

import SFBaseKit

class TabBarCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var iconLabel: UILabel!
    
}

// MARK: - Configurable
extension TabBarCollectionViewCell: Configurable {
    
    func configureWith(_ data: TabBarCollectionViewCellViewModelProtocol) {
        iconImage.image = UIImage(named: data.iconImage)
        iconImage.image = iconImage.image?.withRenderingMode(.alwaysTemplate)
        iconLabel.text = data.iconLabel
    }
    
}
