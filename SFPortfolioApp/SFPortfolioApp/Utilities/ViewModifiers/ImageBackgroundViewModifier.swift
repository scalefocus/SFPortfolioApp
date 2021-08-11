//
//  ImageBackgroundViewModifier.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import SwiftUI

/// A view modifier used for attaching an image background to a specific view.
struct ImageBackgroundViewModifier: ViewModifier {
    
    let image: Image
    
    private var backgroundView: some View {
        image
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
    
    func body(content: Content) -> some View {
        content
            .background(backgroundView)
    }
    
}
