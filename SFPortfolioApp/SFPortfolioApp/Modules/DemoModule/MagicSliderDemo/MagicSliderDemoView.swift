//
//  MagicSliderDemoView.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 2.11.21.
//

import SwiftUI

struct MagicSliderDemoView<T: MagicSliderViewModel>: View {
    
    // MARK: - Properties
    @ObservedObject var primaryVerticalViewModel: T
    @ObservedObject var secondaryVerticalViewModel: T
    @ObservedObject var horizontalViewModel: T
    private let spacing: CGFloat = 15
    private let tagHeight: CGFloat = 30
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: spacing) {
            verticalSldiers
            horizontalSldier
            statusView
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .primaryBackground
        .primaryNavigationBarSetup(with: Constants.CategoryItemTitle.magicSliderView)
    }
    
}

// MARK: - Helpers
extension MagicSliderDemoView {
    
    private var horizontalSldierConfig: MagicSliderConfig {
        MagicSliderConfig(orientation: .horiontal)
    }
    
    private var verticalSldierConfig: MagicSliderConfig {
        MagicSliderConfig(orientation: .vertical)
    }
    
    private var secondaryVerticalSldierConfig: MagicSliderConfig {
        MagicSliderConfig(orientation: .vertical,
                          outerColor: .gray,
                          innerColor: .gray)
    }
    
}

// MARK: - Private Views
extension MagicSliderDemoView {
    
    private var verticalSldiers: some View {
        HStack(spacing: spacing) {
            MagicSliderView(viewModel: primaryVerticalViewModel,
                            config: verticalSldierConfig,
                            tagMaxHeigh: tagHeight)
                .frame(width: 100, height: 200)
            MagicSliderView(viewModel: secondaryVerticalViewModel,
                            config: secondaryVerticalSldierConfig,
                            tagMaxHeigh: tagHeight)
                .frame(width: 100, height: 300)
        }
    }
    
    private var horizontalSldier: some View {
        MagicSliderView(viewModel: horizontalViewModel,
                        config: horizontalSldierConfig,
                        tagMaxHeigh: tagHeight)
            .frame(width: 300, height: 100)
    }
    
    private var statusView: some View {
        VStack {
            Text("Left slider value - \(Int(primaryVerticalViewModel.sliderProgress * 100))%")
            Text("Right slider value - \(Int(secondaryVerticalViewModel.sliderProgress * 100))%")
            Text("Horizontal slider value - \(Int(horizontalViewModel.sliderProgress * 100))%")
        }
    }
    
}

struct MagicSliderDemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        MagicSliderDemoView(primaryVerticalViewModel: MagicSliderViewModel(),
                            secondaryVerticalViewModel: MagicSliderViewModel(),
                            horizontalViewModel: MagicSliderViewModel())
    }
    
}
