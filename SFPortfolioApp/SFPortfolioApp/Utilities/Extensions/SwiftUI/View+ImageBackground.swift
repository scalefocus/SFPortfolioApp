//
//  View+PrimaryBackground.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import SwiftUI

extension View {
    
    var primaryBackground: some View {
        imageBackground(with: Image(uiImage: .background))
    }
    
    func imageBackground(with image: Image) -> some View {
        modifier(ImageBackgroundViewModifier(image: image))
    }
    
}
