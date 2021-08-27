//
//  AppCoordinator.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 29.06.21.
//

import SFBaseKit

class AppCoordinator: Coordinator {
    
    // MARK: - Private Properties
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    // MARK: - Init
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        navigationController.setupNavigationBarAppearance()
        window.makeKeyAndVisible()
    }
    
    // MARK: - Public Functions
    override func start() {
        startSplashScene()
    }
    
    // MARK: - Private Functions
    /// Should start the coordinator of next scene and add it as child coordinator to the current one.
    private func startCategoryModule() {
        window.rootViewController = navigationController
        let categoryCoordinator = CategoryCoordinator(navigationController: navigationController)
        addChildCoordinator(categoryCoordinator)
        categoryCoordinator.start()
    }
    
    private func startSplashScene() {
        let viewModel = SplashViewModel()
        viewModel.delegate = self
        let splashViewController = SplashViewController.create(viewModel: viewModel)
        window.rootViewController = splashViewController
    }
    
}

// MARK: - SplashViewModelCoordinatorDelegate
extension AppCoordinator: SplashViewModelCoordinatorDelegate {
    
    func didFinishSplashScene() {
        startCategoryModule()
    }
    
}
