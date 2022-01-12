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
            verticalSlider
            horizontalSlider
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
    
    private var horizontalSliderConfig: MagicSliderConfig {
        MagicSliderConfig(orientation: .horiontal)
    }
    
    private var verticalSliderConfig: MagicSliderConfig {
        MagicSliderConfig(orientation: .vertical)
    }
    
    private var secondaryVerticalSliderConfig: MagicSliderConfig {
        MagicSliderConfig(orientation: .vertical,
                          outerColor: .gray,
                          innerColor: .gray)
    }
    
}

// MARK: - Private Views
extension MagicSliderDemoView {
    
    private var verticalSlider: some View {
        HStack(spacing: spacing) {
            MagicSliderView(viewModel: primaryVerticalViewModel,
                            config: verticalSliderConfig,
                            tagMaxHeigh: tagHeight)
                .frame(width: 100, height: 200)
            MagicSliderView(viewModel: secondaryVerticalViewModel,
                            config: secondaryVerticalSliderConfig,
                            tagMaxHeigh: tagHeight)
                .frame(width: 100, height: 300)
        }
    }
    
    private var horizontalSlider: some View {
        MagicSliderView(viewModel: horizontalViewModel,
                        config: horizontalSliderConfig,
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
