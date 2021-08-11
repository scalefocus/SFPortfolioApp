//
//  SegmentedControlDemoView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 12.08.21.
//

import SwiftUI

struct SegmentedControlDemoView: View {
    
    // MARK: - View Model
    @ObservedObject var primaryViewModel: SegmentedControlDemoViewModel
    @ObservedObject var secondaryViewModel: SegmentedControlDemoViewModel
    
    // MARK: - Main View
    var body: some View {
        VStack(spacing: 60) {
            fullSizeSegmentedControlView
            shrunkSegmentedControlView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 8)
        .primaryBackground
        .primaryNavigationBarSetup(with: primaryViewModel.title)
    }
}

// MARK: - Private Views
extension SegmentedControlDemoView {
    
    private var fullSizeSegmentedControlView: some View {
        VStack(alignment: .leading, spacing: 5) {
            infoLabel(with: primaryViewModel.fullSizeLabel)
            SegmentedControlView(viewModel: primaryViewModel,
                                 config: config(height: 52, cornerRadius: 4))
        }
    }
    
    private var shrunkSegmentedControlView: some View {
        VStack(alignment: .leading, spacing: 5) {
            infoLabel(with: secondaryViewModel.shrunkLabel)
            SegmentedControlView(viewModel: secondaryViewModel,
                                 config: config(height: 32, cornerRadius: 20))
                .padding(.trailing, 32)
        }
    }
    
    private func infoLabel(with title: String) -> some View {
        Text(title)
            .font(.custom(size: 18))
            .foregroundColor(Color.black.opacity(0.7))
            .padding(.leading, 4)
    }
    
    private func config(height: CGFloat, cornerRadius: CGFloat) -> SegmentedControlViewConfig {
        SegmentedControlViewConfig(height: height,
                                   cornerRadius: cornerRadius,
                                   backgroundColor: Color.black.opacity(0.45),
                                   font: .body,
                                   selectedItemBackgroundColor: Color.white.opacity(0.65),
                                   selectedItemFontColor: Color.black.opacity(0.75),
                                   defaultItemBackgroundColor: .clear,
                                   defaultItemFontColor: .white,
                                   borderWidth: 1,
                                   borderColor: Color.accentColor.opacity(0.5))
    }
    
}

// MARK: - Preview
struct CustomSegmentedControlDemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        SegmentedControlDemoView(primaryViewModel: SegmentedControlDemoViewModel(),
                                 secondaryViewModel: SegmentedControlDemoViewModel())
    }
    
}
