//
//  PieProgressIndicatorDemoView.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 29.09.21.
//

import SwiftUI

struct PieProgressIndicatorDemoView<T: PieProgressIndicatorViewModel>: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: T
    let config: PieProgressIndicatorConfig
    
    private let cornerRadius: CGFloat = 22
    private let shadowOffset: CGFloat = 5
    private let cardWidth: CGFloat = 250
    private let cardHeight: CGFloat = 350
    
    // MARK: - Body
    var body: some View {
        VStack {
            cardView
            startButton
                .padding(.top)
        }
        .shadow(color: .gray,
                radius: Constants.General.defaultShadowRadius,
                x: .zero,
                y: shadowOffset)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .primaryBackground
        .primaryNavigationBarSetup(with: Constants.CategoryItemTitle.pieProgressIndicator)
    }
    
    // MARK: - Private Views
    private var startButton: some View {
        RoundedButtonView(title: "Start") {
            viewModel.start()
        }
        .hidden(if: !viewModel.isFinished)
    }
    
    private var cardView: some View {
        Image(uiImage: .logo)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: cardWidth, height: cardHeight)
            .background(Color.white)
            .pieProgressIndicator(viewModel: viewModel, config: config)
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.black))
    }
    
}

// MARK: - Preview
struct PieProgressIndicatorDemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        PieProgressIndicatorDemoView(viewModel: PieProgressIndicatorViewModel(), config: PieProgressIndicatorConfig())
    }
    
}
