//
//  ExecutionButtonWidthPreferenceKey.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

// Implementation of `PreferenceKey` used to persist the width of the component
// so it scales dynamically based on the proposed size from the parent.
struct ExecutionButtonWidthPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        // Do nothing, persist initial value from the geometry reader.
    }
    
}
