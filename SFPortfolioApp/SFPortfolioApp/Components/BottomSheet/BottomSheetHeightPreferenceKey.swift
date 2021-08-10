//
//  BottomSheetHeightPreferenceKey.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

/// An implementation of `PreferenceKey` used by child view for passing a height
/// value to a concrete subscribed parent needed for the correct sizing afterwards.
struct BottomSheetHeightPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
    
}
