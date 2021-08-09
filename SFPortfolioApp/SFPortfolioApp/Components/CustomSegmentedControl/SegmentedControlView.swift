//
//  SegmentedControlView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 9.08.21.
//

import SwiftUI

struct SegmentedControlView<T: SegmentedControlViewModelProtocol>: View {
    
    @ObservedObject var viewModel: T
    let config: SegmentedControlViewConfig
    
    private var itemsCount: CGFloat {
        CGFloat(viewModel.tabItems.count)
    }
    
    private var selectedIndex: CGFloat {
        CGFloat(viewModel.selectedTabIndex)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                selectedItemOverlay
                    .frame(width: geometry.size.width / itemsCount, height: config.height)
                    .offset(x: geometry.size.width / itemsCount * selectedIndex, y: 0)
                    .animation(.default)
                itemsList
            }
            .background(config.backgroundColor)
            .overlay(segmentedControlOverlay)
            .cornerRadius(config.cornerRadius)
        }
    }
    
}

// MARK: - Private Views
extension SegmentedControlView {
    
    private var segmentedControlOverlay: some View {
        RoundedRectangle(cornerRadius: config.cornerRadius)
            .stroke(config.borderColor, lineWidth: config.borderWidth)
    }
    
    private var selectedItemOverlay: some View {
        RoundedRectangle(cornerRadius: config.cornerRadius)
            .fill(config.selectedItemBackgroundColor)
    }
    
    
    private var itemsList: some View {
        HStack(spacing: 0) {
            ForEach(viewModel.tabItems) { item in
                SegmentedControlItemView(title: item.title,
                                         isSelected: viewModel.isTabSelected(item),
                                         selectedItemFontColor: config.selectedItemFontColor,
                                         defaultItemFontColor: config.defaultItemFontColor,
                                         font: config.font,
                                         onTapAction: { viewModel.onTabChange(with: item.id) })
            }
        }
    }
    
}
