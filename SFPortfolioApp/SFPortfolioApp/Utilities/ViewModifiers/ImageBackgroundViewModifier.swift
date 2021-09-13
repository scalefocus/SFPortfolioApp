//
//  ImageBackgroundViewModifier.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import SwiftUI

/// A view modifier used for attaching an image background to a specific view.
struct ImageBackgroundViewModifier: ViewModifier {
    
    // MARK: - Properties
    let image: Image
    let logo: Image
    private let logoWidth = Constants.General.logoWidth
    private let logoHeight = Constants.General.logoHeight
    
    // MARK: - Main View
    func body(content: Content) -> some View {
        content
            .background(backgroundView)
            .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: - Private Views
    private var footerView: some View {
        HStack {
            logo
                .resizable()
                .frame(width: logoWidth, height: logoHeight, alignment: .center)
            Spacer()
        }
        .background(Color(.barBackground))
    }
    
    private var backgroundView: some View {
        VStack(spacing: .zero) {
            image
                .resizable()
            footerView
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}
