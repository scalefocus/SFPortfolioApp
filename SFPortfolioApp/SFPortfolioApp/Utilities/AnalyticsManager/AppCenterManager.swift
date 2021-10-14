//
//  AppCenterManager.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 18.10.21.
//

import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class AppCenterManager: AnalyticsManagerProtocol {
    
    // MARK: - Properties
    static let shared = AppCenterManager(key: Constants.appCenterKey)
    
    private let key: String
    
    // MARK: - Init
    private init(key: String) {
        self.key = key
    }
    
    // MARK: - Public Functions
    func start() {
        AppCenter.start(withAppSecret: key, services: [Analytics.self, Crashes.self])
    }
    
}

// MARK: - Constants
extension Constants {
    
    /// `AppCenter` key for `Analytics` and `Crashes` reports.
    static let appCenterKey = "27c59676-5f8c-4551-9a71-4dc6cdc9c437"
    
}
