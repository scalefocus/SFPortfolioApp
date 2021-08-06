//
//  AsymmetricCollectionSettingsViewController.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.08.21.
//

import SFBaseKit

class AsymmetricCollectionSettingsViewController: BaseViewController {
    
    // MARK: - Properties
    private var viewModel: AsymmetricCollectionSettingsViewModelProtocol!
    
    // MARK: - IBOutlets
    @IBOutlet private weak var numberOfCellsSlider: UISlider!
    @IBOutlet private weak var cellPaddingSlider: UISlider!
    @IBOutlet private weak var sizeRatioSlider: UISlider!
    @IBOutlet private weak var verticalOffsetSlider: UISlider!
    
    // MARK: - IBActions
    @IBAction private func didSlide(_ sender: UISlider) {
        switch sender {
        case numberOfCellsSlider:
            viewModel.changeNumberOfCellsPerRow(sender.value)
        case cellPaddingSlider:
            viewModel.changeCellPadding(sender.value)
        case sizeRatioSlider:
            viewModel.changeCellSizeRatio(sender.value)
        case verticalOffsetSlider:
            viewModel.changeCellVerticalOffset(sender.value)
        default:
            break
        }
    }
    
}

// MARK: - Instantiate
extension AsymmetricCollectionSettingsViewController {
    
    static func create(viewModel: AsymmetricCollectionSettingsViewModelProtocol) -> UIViewController {
        let viewController = AsymmetricCollectionSettingsViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
