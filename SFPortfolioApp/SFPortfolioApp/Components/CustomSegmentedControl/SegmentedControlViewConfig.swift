//
//  SegmentedControlViewConfig.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 9.08.21.
//

import SwiftUI

/// Model defining base appearance configuration of a segmented control. 
struct SegmentedControlViewConfig {
    
    // Main
    let height: CGFloat
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let font: Font
    
    // Selected Item
    let selectedItemBackgroundColor: Color
    let selectedItemFontColor: Color
    
    // Default Item
    let defaultItemBackgroundColor: Color
    let defaultItemFontColor: Color
    
    // Border
    let borderWidth: CGFloat
    let borderColor: Color
    
}
