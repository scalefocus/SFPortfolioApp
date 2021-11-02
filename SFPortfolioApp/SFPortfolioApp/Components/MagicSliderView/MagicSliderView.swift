//
//  MagicSliderView.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 2.11.21.
//

import SwiftUI

struct MagicSliderView<T: MagicSliderViewModelProtocol>: View {
    
    // MARK: - Configuration
    @ObservedObject var viewModel: T
    let config: MagicSliderConfig
    let maxSize: CGFloat
    let tagMaxHeigh: CGFloat
    
    // MARK: - Body
    var body: some View {
        sliderRect
            .cornerRadius(config.sliderCornerRadius(size: maxSize))
            .overlay(progressTag, alignment: overlayAlignment)
            .gesture(DragGesture(minimumDistance: 0)
                        .onChanged { viewModel.onDragChanged(dragValue($0), maxDragValue: maxSize) }
                        .onEnded { _ in viewModel.onDragEnded(maxDragValue: maxSize) }
            )
    }
    
}

// MARK: - Helpers
extension MagicSliderView {
    
    private var overlayAlignment: Alignment {
        config.orientation == .vertical ? .bottom : .center
    }
    
    private var progressInfo: String {
        "\(Int(viewModel.sliderProgress * 100))%"
    }
    
    private func dragValue(_ dragGestureValue: DragGesture.Value) -> CGFloat {
        let translation = dragGestureValue.translation
        return config.orientation == .vertical ? -translation.height : translation.width
    }
    
    private var innerSliderHorizontarOffset: CGFloat {
        (viewModel.sliderSize - maxSize) / 2
    }
    
    private var tagVerticalOffset: CGFloat {
        let sizeNeeded = tagMaxHeigh * config.aspectRatio
        let isTagOverlapping = viewModel.sliderSize < maxSize - sizeNeeded
        return isTagOverlapping ? -viewModel.sliderSize : -maxSize + sizeNeeded
    }
    
}

// MARK: - Private Views
extension MagicSliderView {
    
    private var outerRect: some View {
        Rectangle()
            .fill(config.outerColor)
            .opacity(config.outerOpacity)
    }
    
    private var innerRect: some View {
        let rect = Rectangle()
            .fill(config.innerColor)
        switch config.orientation {
        case .vertical:
            return rect
                .frame(height: viewModel.sliderSize)
                .anyView
        case .horiontal:
            return rect
                .frame(width: viewModel.sliderSize)
                .offset(x: innerSliderHorizontarOffset)
                .anyView
        }
    }
    
    private var progressTag: some View {
        let text = Text(progressInfo)
            .fontWeight(.bold)
            .foregroundColor(config.tagForegroundColor)
            .frame(maxHeight: tagMaxHeigh)
            .padding(config.tagPadding)
            .background(config.tagBackgroundColor)
            .cornerRadius(config.tagCornerRadius)
            .padding(.vertical, config.tagPadding)
        switch config.orientation {
        case .vertical:
            return text
                .offset(y: tagVerticalOffset)
                .anyView
        case .horiontal:
            return text
                .anyView
        }
    }
    
    private var sliderRect: some View {
        let sliderRect = ZStack(alignment: .bottom) {
            outerRect
            innerRect
        }
        switch config.orientation {
        case .vertical:
            return sliderRect
                .frame(width: maxSize / config.aspectRatio, height: maxSize)
        case .horiontal:
            return sliderRect
                .frame(width: maxSize, height: maxSize / config.aspectRatio)
        }
    }
    
}

// MARK: - Preview
struct MagicSliderView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            MagicSliderView(viewModel: MagicSliderViewModel(), config: MagicSliderConfig(orientation: .horiontal), maxSize: 300, tagMaxHeigh: 30)
            MagicSliderView(viewModel: MagicSliderViewModel(), config: MagicSliderConfig(orientation: .vertical), maxSize: 300, tagMaxHeigh: 30)
        }
    }
    
}
