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
    
    // MARK: - Init
    init(window: UIWindow) {
        self.window = window
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    // MARK: - Public Functions
    /// Should start the coordinator of next scene and add it as child coordinator to the current one.
    override func start() {
    }
    
}
