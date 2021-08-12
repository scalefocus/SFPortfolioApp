//
//  ShimmerLoadingView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 12.08.21.
//

import SwiftUI

struct ShimmerLoadingView: View {
    
    // MARK: - Configuration
    let config: ShimmerLoadingViewConfig
    
    // MARK: - Private properties
    @State private var startPoint: CGFloat = -0.3
    private let step: CGFloat = 0.5
    
    private var animation: Animation {
        Animation
            .linear(duration: config.animationDuration)
            .repeatForever(autoreverses: config.autoreverses)
    }
    
    // MARK: - Main View
    var body: some View {
        Rectangle()
            .fill(linearFillGradient)
            .cornerRadius(config.cornerRadius)
            .frame(height: config.height)
            .onAppear(perform: start)
    }
    
}

// MARK: - Helpers
extension ShimmerLoadingView {
    
    private var linearFillGradient: some ShapeStyle {
        LinearGradient(gradient: Gradient(colors: config.gradientColors),
                       startPoint: UnitPoint(x: startPoint, y: 0.5),
                       endPoint: UnitPoint(x: startPoint + step, y: 0.5))
    }
    
    private func start() {
        withAnimation(animation) {
            startPoint = 1
        }
    }
    
}

// MARK: - Preview
struct ShimmerLoadingView_Previews: PreviewProvider {
    
    static let gradientColors = [
        Color.black.opacity(0.4),
        Color.black.opacity(0.2),
        Color.black.opacity(0.4)
    ]
    
    static let config = ShimmerLoadingViewConfig(height: 20, gradientColors: gradientColors)
    
    static var previews: some View {
        ShimmerLoadingView(config: config)
    }
}
