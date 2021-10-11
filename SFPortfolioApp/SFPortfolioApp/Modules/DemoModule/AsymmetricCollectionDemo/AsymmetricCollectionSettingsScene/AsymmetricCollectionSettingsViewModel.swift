//
//  AsymmetricCollectionSettingsViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 5.08.21.
//

import UIKit

class AsymmetricCollectionSettingsViewModel: AsymmetricCollectionSettingsViewModelProtocol {
    
    // MARK: - Properties
    weak var delegate: AsymmetricCollectionSettingsViewModelCoordinatorDelegate?
    private let configurator: Observable<AsymmetricCollectionViewLayoutConfigurator>

    var cellPadding: Float {
        get {
            Float(configurator.value.cellPaddingRatio)
        }
        set {
            configurator.value.cellPaddingRatio = CGFloat(newValue)
        }
    }
    
    var sizeRatio: Float {
        get {
            Float(configurator.value.cellHeightRatio)
        }
        set {
            configurator.value.cellHeightRatio = CGFloat(newValue)
        }
    }
    
    var verticalOffset: Float {
        get {
            Float(configurator.value.verticalOffsetRatio)
        }
        set {
            configurator.value.verticalOffsetRatio = CGFloat(newValue)
        }
    }
    
    var numberOfCellsPerRow: Float {
        get {
            Float(configurator.value.numberOfColumnsInPortrait)
        }
        set {
            configurator.value.numberOfColumnsInPortrait = Int(newValue)
        }
    }
    
    // MARK: - Init
    init(layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator>) {
        self.configurator = layoutConfigurator
    }
    
    // MARK: - Public Functions
    func didSelectPlay() {
        delegate?.didFinishAsymmetricCollectionSettingsScene()
    }
    
}
