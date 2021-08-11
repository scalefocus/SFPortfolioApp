//
//  View+BaseHostingController.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 11.08.21.
//

import SwiftUI

extension View {
    
    /// Custom view extension property providing easier usage of `BaseHostingController` transformation by wrapping `self`.
    var hostingController: BaseHostingController<Self> {
        BaseHostingController(rootView: self)
    }
    
}
