//
//  StatusBarUtilityEnvironmentKey.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

/// An implementation of `EnvironmentKey` used for defining a custom key for `StatusBarUtility`.
struct StatusBarUtilityEnvironmentKey: EnvironmentKey {

    static var defaultValue: StatusBarUtility = StatusBarUtility()

}

extension EnvironmentValues {
    
    /// Custom `statusBarUtility` extended environment value with the custom defined `StatusBarUtilityEnvironmentKey`.
    var statusBarUtility: StatusBarUtility {
        self[StatusBarUtilityEnvironmentKey.self]
    }
    
}
