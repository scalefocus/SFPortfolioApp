//
//  PieProgressIndicatorViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 29.09.21.
//

import Foundation

class PieProgressIndicatorViewModel: PieProgressIndicatorViewModelProtocol {
    
    // MARK: - Properties
    @Published private(set) var progress = 0.0
    @Published private(set) var isFinished = true

    // MARK: - Public Functions
    func start() {
        progress = 0.0
        isFinished = false
        (.zero...Constants.notificationsCount).forEach { interval in
            let progress = TimeInterval(interval) / Double(Constants.notificationsCount)
            let delay = progress * Constants.delayRatio
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
                self?.progress = progress
                guard interval == Constants.notificationsCount else { return }
                
                self?.isFinished = true
            }
        }
    }
    
}

// MARK: - Constants
private extension Constants {
    
    /// Indicates how many times `progress` value will be updated.
    static let notificationsCount = 10
    
    /// The ratio to use for delaying the notification about `progress` update. Use 1 to maintain the current delay.
    static let delayRatio = 2.0
    
}
