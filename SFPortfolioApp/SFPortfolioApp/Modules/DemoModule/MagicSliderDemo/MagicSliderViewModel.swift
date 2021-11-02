//
//  MagicSliderViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 2.11.21.
//

import SwiftUI

class MagicSliderViewModel: MagicSliderViewModelProtocol {

    // MARK: - Properties
    @Published private(set) var sliderProgress: CGFloat = 0
    @Published private(set) var sliderSize: CGFloat = 0
    private var lastDragValue: CGFloat = 0
    
    // MARK: - Public Functions
    func onDragChanged(_ value: CGFloat, maxDragValue: CGFloat) {
        sliderSize = lastDragValue + value
        limitSlider(maxDragValue: maxDragValue)
        let progress = sliderSize / maxDragValue
        sliderProgress = progress <= 1 ? progress : 1
    }
    
    func onDragEnded(maxDragValue: CGFloat) {
        limitSlider(maxDragValue: maxDragValue)
        lastDragValue = sliderSize
    }
    
    // MARK: - Private Functions
    private func limitSlider(maxDragValue: CGFloat) {
        sliderSize = sliderSize > maxDragValue ? maxDragValue : sliderSize
        sliderSize = sliderSize >= 0 ? sliderSize : 0
    }
    
}
