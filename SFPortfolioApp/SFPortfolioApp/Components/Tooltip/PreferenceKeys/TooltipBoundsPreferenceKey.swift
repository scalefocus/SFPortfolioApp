//
//  TooltipBoundsPreferenceKey.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

/// An implementation of `PreferenceKey` used for passing by the child views and
/// collecting all tooltips' positions within the container, used afterwards for their drawing.
struct TooltipBoundsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [Anchor<CGRect>] = []
    
    static func reduce(value: inout [Anchor<CGRect>], nextValue: () -> [Anchor<CGRect>]) {
        value.append(contentsOf: nextValue())
    }
    
}
