//
//  ShimmerLoadingDemoView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 12.08.21.
//

import SwiftUI

struct ShimmerLoadingDemoView: View {
    
    var body: some View {
        VStack(spacing: 70) {
            defaultShimmerView
            reversingShimmerView
        }
        .font(.custom(size: 18))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .primaryBackground
        .primaryNavigationBarSetup(with: Constants.CategoryItemTitle.shimmerLoadingView)
    }
    
}

// MARK: - Helpers
extension ShimmerLoadingDemoView {
    
    private var defaultShimmerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Default: ")
                .foregroundColor(Color.black.opacity(0.7))
            ShimmerLoadingView(config: shimmerViewConfig())
        }
    }
    
    private var reversingShimmerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Reversing: ")
                .foregroundColor(Color.black.opacity(0.7))
            ShimmerLoadingView(config: shimmerViewConfig(autoreverses: true))
        }
    }
    
    private var defaultGradientColors: [Color] {[
        Color.black.opacity(0.4),
        Color.black.opacity(0.2),
        Color.black.opacity(0.4)
    ]}
    
    private func shimmerViewConfig(animationDuration: Double = 1,
                                   autoreverses: Bool = false) -> ShimmerLoadingViewConfig {
        ShimmerLoadingViewConfig(height: 22,
                                 gradientColors: defaultGradientColors,
                                 animationDuration: animationDuration,
                                 autoreverses: autoreverses)
    }
    
}

// MARK: - Preview
struct ShimmerLoadingDemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        ShimmerLoadingDemoView()
    }
    
}
