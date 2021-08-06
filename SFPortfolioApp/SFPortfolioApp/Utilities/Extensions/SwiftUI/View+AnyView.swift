//
//  View+AnyView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

extension View {
    
    /// Provides more convenient and readable usage of `AnyView` transformation which can be attached directly in the view chain.
    var anyView: AnyView {
        AnyView(self)
    }
    
}
