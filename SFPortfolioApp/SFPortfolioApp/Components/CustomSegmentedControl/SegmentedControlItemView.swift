//
//  SegmentedControlItemView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 9.08.21.
//

import SwiftUI

struct SegmentedControlItemView: View {
    
    let title: String
    let isSelected: Bool
    let selectedItemFontColor: Color
    let defaultItemFontColor: Color
    let font: Font
    let onTapAction: () -> Void
    
    var body: some View {
        Button(action: onTapAction) {
            Text(title)
                .font(font)
                .foregroundColor(isSelected ? selectedItemFontColor : defaultItemFontColor)
                .frame(maxWidth: .infinity)
        }
    }
    
}
