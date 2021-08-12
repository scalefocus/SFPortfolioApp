//
//  AsymmetricCollectionDemoCoordinator.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.08.21.
//

import SFBaseKit

class AsymmetricCollectionDemoCoordinator: Coordinator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Functions
    override func start() {
        startAsymmetricDemoScene()
    }
    
    // MARK: - Private Functions
    private func startAsymmetricDemoScene() {
        let viewModel = AsymmetricCollectionDemoViewModel()
        viewModel.delegate = self
        let viewController = AsymmetricCollectionDemoViewController.create(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - AsymmetricCollectionDemoViewModelCoordinatorDelegate
extension AsymmetricCollectionDemoCoordinator: AsymmetricCollectionDemoViewModelCoordinatorDelegate {
    func didFinishDemoSceneWithSettingsSelected(configurator: Observable<AsymmetricCollectionViewLayoutConfigurator>) {
        let viewModel = AsymmetricCollectionSettingsViewModel(layoutConfigurator: configurator)
        let viewController = AsymmetricCollectionSettingsViewController.create(viewModel: viewModel)
        navigationController.present(viewController, animated: true)
    }
    
    func didFinishAsymmetricCollectionDemoScene() {
        navigationController.navigationBar.prefersLargeTitles = true
        finish()
    }
    
}
