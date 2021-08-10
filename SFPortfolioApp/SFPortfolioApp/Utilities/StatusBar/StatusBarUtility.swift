//
//  StatusBarUtility.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

/// Protocol defining needed status bar info functionality.
protocol StatusBarUtilityProtocol {
    
    /// Returns the height of the status bar for the specific scene/device.
    var statusBarHeight: CGFloat { get }
    
}

/// Implementation of `StatusBarUtilityProtocol`.
class StatusBarUtility: StatusBarUtilityProtocol {
    
    private var manager: UIStatusBarManager? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.statusBarManager
    }
    
    var statusBarHeight: CGFloat {
        manager?.statusBarFrame.height ?? 0
    }
    
}
