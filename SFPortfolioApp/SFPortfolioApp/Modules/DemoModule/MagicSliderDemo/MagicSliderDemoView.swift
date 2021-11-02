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
    private let sliderHeight: CGFloat = 300
    private let tagHeight: CGFloat = 30
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: spacing) {
            verticalSldiers
            horizontalSldier
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
                            maxSize: sliderHeight,
                            tagMaxHeigh: tagHeight)
            MagicSliderView(viewModel: secondaryVerticalViewModel,
                            config: secondaryVerticalSldierConfig,
                            maxSize: sliderHeight,
                            tagMaxHeigh: tagHeight)
        }
    }
    
    private var horizontalSldier: some View {
        MagicSliderView(viewModel: horizontalViewModel,
                        config: horizontalSldierConfig,
                        maxSize: sliderHeight,
                        tagMaxHeigh: tagHeight)
    }
    
}

struct MagicSliderDemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        MagicSliderDemoView(primaryVerticalViewModel: MagicSliderViewModel(),
                            secondaryVerticalViewModel: MagicSliderViewModel(),
                            horizontalViewModel: MagicSliderViewModel())
    }
    
}
