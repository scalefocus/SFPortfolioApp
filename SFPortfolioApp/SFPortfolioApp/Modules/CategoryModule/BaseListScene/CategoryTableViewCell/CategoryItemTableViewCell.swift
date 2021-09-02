//
//  CategoryItemTableViewCell.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

class CategoryItemTableViewCell: UIResizableTableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tagsStackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Public Functions
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupAccessibility()
        containerView.shadowed()
    }
    
    // MARK: - Private Functions
    private func addTags(_ tags: [InfoTagProtocol]) {
        tags.forEach { [weak self] tag in
            let tagLabel = UITagLabel()
            tagLabel.setupUI()
            tagLabel.configureWith(tag)
            self?.tagsStackView.addArrangedSubview(tagLabel)
        }
    }
    
    private func setupAccessibility() {
        tagsStackView.isAccessibilityElement = true
        tagsStackView.accessibilityIdentifier = Constants.Identifier.tagsStackView
    }
    
}

// MARK: - Configurable
extension CategoryItemTableViewCell: Configurable {
    
    func configureWith(_ data: CategoryItemTableViewCellViewModelProtocol) {
        titleLabel.text = data.title
        tagsStackView.isHidden = data.tags.isEmpty
        addTags(data.tags)
    }
    
}
