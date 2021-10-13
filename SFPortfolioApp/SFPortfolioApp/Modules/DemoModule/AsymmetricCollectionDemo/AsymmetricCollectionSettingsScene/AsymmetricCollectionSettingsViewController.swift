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
    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var numberOfCellsSlider: UISlider!
    @IBOutlet private weak var numberOfCellsLabel: UILabel!
    @IBOutlet private weak var cellPaddingSlider: UISlider!
    @IBOutlet private weak var cellPaddingLabel: UILabel!
    @IBOutlet private weak var sizeRatioSlider: UISlider!
    @IBOutlet private weak var sizeRatioLabel: UILabel!
    @IBOutlet private weak var verticalOffsetSlider: UISlider!
    @IBOutlet private weak var verticalOffsetLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibility()
        setupSliderValues()
    }
    
    // MARK: - IBActions
    @IBAction private func didSlide(_ sender: UISlider) {
        switch sender {
        case numberOfCellsSlider:
            viewModel.numberOfCellsPerRow = sender.value
        case cellPaddingSlider:
            viewModel.cellPadding = sender.value
        case sizeRatioSlider:
            viewModel.sizeRatio = sender.value
        case verticalOffsetSlider:
            viewModel.verticalOffset = sender.value
        default:
            break
        }
    }
    
    @IBAction private func didTapPlayButton(_ sender: UIButton) {
        viewModel.didSelectPlay()
    }
    
    // MARK: - Private Functions
    private func setupAccessibility() {
        view.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsView
        playButton.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsPlayButton
        containerView.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsContainerView
        numberOfCellsLabel.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsNumberOfCellsLabel
        numberOfCellsSlider.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsNumberOfCellsSlider
        sizeRatioLabel.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsSizeRatioLabel
        sizeRatioSlider.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsSizeRatioSlider
        verticalOffsetLabel.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsOffsetLabel
        verticalOffsetSlider.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsOffsetSlider
        cellPaddingLabel.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsCellPaddingLabel
        cellPaddingSlider.accessibilityIdentifier = Constants.Identifier.asymmetricSettingsCellPaddingSlider
    }
    
    private func setupSliderValues() {
        numberOfCellsSlider.value = viewModel.numberOfCellsPerRow
        cellPaddingSlider.value = viewModel.cellPadding
        sizeRatioSlider.value = viewModel.sizeRatio
        verticalOffsetSlider.value = viewModel.verticalOffset
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
