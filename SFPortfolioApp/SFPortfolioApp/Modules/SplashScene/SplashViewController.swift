//
//  SplashViewController.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 26.08.21.
//

import SFBaseKit

class SplashViewController: BaseViewController {

    // MARK: - Properties
    private var viewModel: SplashViewModelProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.start()
    }
    
}

// MARK: - Instantiate
extension SplashViewController {
    
    static func create(viewModel: SplashViewModelProtocol) -> UIViewController {
        let viewController = SplashViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
