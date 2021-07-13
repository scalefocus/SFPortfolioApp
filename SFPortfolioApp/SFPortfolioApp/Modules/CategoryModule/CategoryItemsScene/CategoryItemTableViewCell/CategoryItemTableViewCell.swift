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
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Public Functions
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.shadowed()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let edgeInsets = UIDevice.current.orientation.isLandscape
            ? Constants.landscapeCellInsets
            : Constants.portraitCellInsets
        contentView.frame = contentView.frame.inset(by: edgeInsets)
    }
    
}

// MARK: - Configurable
extension CategoryItemTableViewCell: Configurable {
    
    func configureWith(_ data: CategoryItemTableViewCellViewModelProtocol) {
        titleLabel.text = data.title
    }
    
}
