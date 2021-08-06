//
//  AsymmetricCollectionSettingsViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 5.08.21.
//

import UIKit

class AsymmetricCollectionSettingsViewModel: AsymmetricCollectionSettingsViewModelProtocol {
    
    // MARK: - Properties
    private let layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator>
    private var configurator: AsymmetricCollectionViewLayoutConfigurator {
        didSet {
            layoutConfigurator.value = configurator
        }
    }
    
    init(configurator: AsymmetricCollectionViewLayoutConfigurator = AsymmetricCollectionViewLayoutConfigurator(),
         layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator>) {
        self.configurator = configurator
        self.layoutConfigurator = layoutConfigurator
    }
    
    // MARK: - Public Functions
    func changeNumberOfCellsPerRow(_ value: Float) {
        configurator.numberOfColumnsInPortrait = Int(value)
    }
    
    func changeCellPadding(_ value: Float) {
        configurator.cellPaddingRatio = CGFloat(value)
    }
    
    func changeCellSizeRatio(_ value: Float) {
        configurator.cellHeightRatio = CGFloat(value)
    }
    
    func changeCellVerticalOffset(_ value: Float) {
        configurator.verticalOffsetRatio = CGFloat(value)
    }
    
}
