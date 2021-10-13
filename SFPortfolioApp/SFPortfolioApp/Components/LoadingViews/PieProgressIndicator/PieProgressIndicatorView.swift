//
//  PieProgressIndicatorView.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 29.09.21.
//

import SwiftUI

struct PieProgressIndicatorView<T: PieProgressIndicatorViewModelProtocol>: View {
    
    // MARK: - Configuration
    @ObservedObject var viewModel: T
    let config: PieProgressIndicatorConfig
    let width: CGFloat
    let height: CGFloat
    
    // MARK: - Body
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(config.color)
            .opacity(opacity)
            .mask(holeShapeMask(in: contentRect).fill(style: FillStyle(eoFill: true)))
            .overlay(overlayView)
            .animation(animation)
    }
    
}

// MARK: - Helpers
extension PieProgressIndicatorView {
    
    private var outerPieRadius: CGFloat {
        min(width, height) / 2
    }
    
    private var pieRadius: CGFloat {
        outerPieRadius - config.piePadding
    }
    
    private var contentRect: CGRect {
        CGRect(x: .zero, y: .zero, width: width, height: height)
    }
    
    private var animation: Animation? {
        viewModel.progress != .zero ? .easeInOut : nil
    }
    
    private var opacity: Double {
        viewModel.isFinished ? .zero : config.opacity
    }
    
    private var progress: CGFloat {
        CGFloat(viewModel.progress)
    }
    
}

// MARK: - Private Views
extension PieProgressIndicatorView {
    
    private func holeShapeMask(in rect: CGRect) -> Path {
        var shape = Rectangle().path(in: rect)
        // Having the x and y as 10 and the width & height reduced by 20
        // is what gives us the full shape outline
        let outlineWidth = config.pieOutlineBorderWidth
        let newRect = CGRect(x: outlineWidth,
                             y: outlineWidth,
                             width: rect.width - 2 * outlineWidth,
                             height: rect.height - 2 * outlineWidth)
        shape.addPath(Circle().path(in: newRect))
        return shape
    }
    
    private var overlayView: some View {
        Circle()
            .trim(from: progress, to: 1)
            .stroke(config.color, lineWidth: pieRadius)
            .frame(width: pieRadius, height: pieRadius)
            .rotationEffect(Angle(degrees: 270))
            .opacity(opacity)
    }
    
}

// MARK: - Preview
struct PieProgressIndicatorView_Previews: PreviewProvider {
    
    static var previews: some View {
        PieProgressIndicatorView(viewModel: PieProgressIndicatorViewModel(),
                                 config: PieProgressIndicatorConfig(),
                                 width: 150,
                                 height: 150)
    }
    
}
