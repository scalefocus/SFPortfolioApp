//
//  View+NavigationBarSetup.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 12.08.21.
//

import SwiftUI

extension View {
    
    /// Modifies the view with the currently used primary navigation bar setup.
    ///
    /// - Parameter title: String title to be used as navigation bar title.
    /// - Returns: `self` with modified navigation bar.
    func primaryNavigationBarSetup(with title: String = "") -> some View {
        navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

