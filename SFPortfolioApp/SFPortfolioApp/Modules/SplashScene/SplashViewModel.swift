//
//  SplashViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 26.08.21.
//

import Foundation

class SplashViewModel: SplashViewModelProtocol {
    
    // MARK: - Properties
    weak var delegate: SplashViewModelCoordinatorDelegate?
    
    // MARK: - Public Functions
    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.General.splashDuration) { [weak self] in
            self?.delegate?.didFinishSplashScene()
        }
    }
    
}
