//
//  View+PrimaryBackground.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import SwiftUI

extension View {
    
    /// Attaches the primary used background image to `self`.
    var primaryBackground: some View {
        imageBackground(with: Image(uiImage: .background), logo: Image(uiImage: .logo))
    }
    
    /// View extension function provided for more convenient and readable usage of `ImageBackgroundViewModifier`.
    ///
    /// - Parameter image: Image to be used for background.
    /// - Parameter logo: Image to be used for footer logo.
    /// - Returns: The modified view with attached image background.
    func imageBackground(with image: Image, logo: Image) -> some View {
        modifier(ImageBackgroundViewModifier(image: image, logo: logo))
    }
    
}
