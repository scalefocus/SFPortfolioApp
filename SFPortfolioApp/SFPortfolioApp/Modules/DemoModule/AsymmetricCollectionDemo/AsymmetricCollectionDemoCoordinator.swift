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
    private let layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator>
    
    // MARK: - Init
    init(navigationController: UINavigationController,
         layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator> = Observable(AsymmetricCollectionViewLayoutConfigurator())) {
        self.navigationController = navigationController
        self.layoutConfigurator = layoutConfigurator
    }
    
    // MARK: - Public Functions
    override func start() {
        startAsymmetricDemoScene()
    }
    
    // MARK: - Private Functions
    private func startAsymmetricDemoScene() {
        let viewModel = AsymmetricCollectionDemoViewModel(layoutConfigurator: layoutConfigurator)
        viewModel.delegate = self
        let viewController = AsymmetricCollectionDemoViewController.create(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - AsymmetricCollectionDemoViewModelCoordinatorDelegate
extension AsymmetricCollectionDemoCoordinator: AsymmetricCollectionDemoViewModelCoordinatorDelegate {
    
    func didFinishDemoSceneWithSettingsSelected() {
        let viewModel = AsymmetricCollectionSettingsViewModel(layoutConfigurator: layoutConfigurator)
        viewModel.delegate = self
        let viewController = AsymmetricCollectionSettingsViewController.create(viewModel: viewModel)
        navigationController.present(viewController, animated: true)
    }
    
    func didFinishAsymmetricCollectionDemoScene() {
        navigationController.navigationBar.prefersLargeTitles = true
        finish()
    }
    
}

// MARK: - AsymmetricCollectionSettingsViewModelCoordinatorDelegate
extension AsymmetricCollectionDemoCoordinator: AsymmetricCollectionSettingsViewModelCoordinatorDelegate {
    
    func didFinishAsymmetricCollectionSettingsScene() {
        navigationController.dismiss(animated: true)
    }
    
}
