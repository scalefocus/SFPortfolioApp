//
//  MagicSliderViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 2.11.21.
//

import SwiftUI

/// Describes the needed implementation for `MagicSliderView` component.
protocol MagicSliderViewModelProtocol: ObservableObject {
   
    /// Value for indicating slider progress.
    var sliderProgress: CGFloat { get }
    
    /// Value for indicating slider filled size.
    var sliderSize: CGFloat { get }
    
    /// Performs drag gesture.
    /// - Parameter value: Drag value transition.
    /// - Parameter maxDragValue: Maximum drag transition to handle.
    func onDragChanged(_ value: CGFloat, maxDragValue: CGFloat)
    
    /// Ends drag gesture.
    /// - Parameter maxDragValue: Maximum drag transition to handle.
    func onDragEnded(maxDragValue: CGFloat)
}
