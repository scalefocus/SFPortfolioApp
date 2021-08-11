//
//  TooltipApplicableModifier.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

/// A view modifier used to be applied on screen container views.
///
/// - Warning: This modifier won't produce any result if used by itself alone.
/// It just subscribes to listen for its child in case any of them has `TooltipElementModifier`
/// and notify that has `Tooltip` prepared.
/// In addition to that there is `TooltipHandler` introduced which manages which `Tooltip` when to be shown
///
/// - Note: There is a view extension provided for convenient usage.
///
/// - Example:
/// ```
/// ContainerView {
///     ElementView()
///         .tooltipElement(handler: handler, identity: "TextKey")
/// }
/// .tooltipApplicable(handler: handler, config: config)
/// ```
struct TooltipApplicableModifier<T: TooltipHandlerProtocol>: ViewModifier {
    
    // MARK: - State
    @State var tooltipContentHeight: CGFloat = 50
    @State var opacityAnimation = false
    @State var offsetAnimation = false
    
    // MARK: - Properties
    private let handler: T
    private let transitionConfig: TooltipTransitionConfig
    
    init(handler: T, transitionConfig: TooltipTransitionConfig) {
        self.handler = handler
        self.transitionConfig = transitionConfig
    }
    
    // MARK: - Main View
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                TapGesture().onEnded(hide)
            )
            .overlayPreferenceValue(TooltipBoundsPreferenceKey.self) { preferences in
                GeometryReader { geometry in
                    preferences
                        .map { tooltipBody(with: geometry[$0]) }
                        .first
                }
            }
    }
}

// MARK: - Private Views
extension TooltipApplicableModifier {
    
    private var measurerBackgroundView: some View {
        GeometryReader { geometry in
            Color.clear.onAppear {
                tooltipContentHeight = geometry.size.height
            }
        }
    }
    
    private func tooltipBody(with frame: CGRect) -> some View {
        handler.shownTooltip.map { tooltip in
            ZStack(alignment: .topLeading) {
                tooltipContentView(with: tooltip)
                    .onTapGesture(perform: hide)
                    .offset(x: tooltip.config.screenPadding,
                            y: tooltipYOffset(frame, tooltip: tooltip))
                    .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 8)
                arrowView(with: tooltip.config)
                    .rotationEffect(arrowRotation(position: tooltip.position))
                    .offset(x: arrowXOffset(frame, config: tooltip.config),
                            y: arrowYOffset(frame, tooltip: tooltip))
            }
            .offset(y: animatableYOffset(position: tooltip.position))
            .opacity(opacityAnimation ? 1 : 0)
            .onAppear(perform: start)
        }
    }
    
    private func tooltipContentView(with tooltip: Tooltip) -> some View {
        HStack(alignment: .top, spacing: 0) {
            Image(tooltip.leadingImageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(tooltip.config.foregroundColor)
                .frame(width: tooltip.config.leadingImageWidth,
                       height: tooltip.config.leadingImageHeight)
                .padding(.leading, tooltip.config.contentPaddingLeft)
            
            VStack(alignment: .leading) {
                Text(tooltip.text)
                    .font(tooltip.config.font)
                    .padding(.horizontal, tooltip.config.contentPaddingLeft)
            }
            .frame(maxWidth: .infinity, minHeight: 24, alignment: .leading)
            
            tooltip.trailingImageName.map {
                Image($0)
                    .resizable()
                    .frame(width: tooltip.config.trailingImageWidth,
                           height: tooltip.config.trailingImageHeight)
                    .padding(.trailing, tooltip.config.contentPaddingRight)
            }
        }
        .padding(.vertical, tooltip.config.contentPaddingTop)
        .frame(width: UIScreen.main.bounds.width - (2 * tooltip.config.screenPadding))
        .foregroundColor(tooltip.config.foregroundColor)
        .background(borderBackgroundView(for: tooltip))
        .clipShape(RoundedRectangle(cornerRadius: tooltip.config.borderRadius))
        .background(measurerBackgroundView)
    }
    
    private func arrowView(with config: TooltipConfig) -> some View {
        ArrowShape()
            .stroke(config.borderColor, lineWidth: config.borderWidth)
            .background(ExtendedArrowShape().fill(config.backgroundColor))
            .frame(width: config.arrowWidth, height: config.arrowHeight)
            .clipShape(ExtendedArrowShape())
    }
    
    private func borderBackgroundView(for tooltip: Tooltip) -> some View {
        RoundedRectangle(cornerRadius: tooltip.config.borderRadius)
            .stroke(tooltip.config.borderColor, lineWidth: tooltip.config.borderWidth)
            .background(tooltip.config.backgroundColor)
    }
    
}

// MARK: - Helpers
extension TooltipApplicableModifier {
    
    private func start() {
        animateOffset(isAppear: true)
        animateOpacity(isAppear: true)
    }
    
    private func hide() {
        guard handler.shownTooltip != nil else { return }
        
        animateOffset(isAppear: false)
        animateOpacity(isAppear: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + transitionConfig.animationDelay) {
            handler.hide()
        }
    }
    
    private func animateOffset(isAppear: Bool) {
        let delay = isAppear ? transitionConfig.transitionDelayTime : 0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(.easeOut(duration: transitionConfig.transitionOffsetDuration)) {
                offsetAnimation = isAppear
            }
        }
    }
    
    private func animateOpacity(isAppear: Bool) {
        let delay = isAppear ? transitionConfig.transitionDelayTime : 0
        let animation = Animation
            .easeOut(duration: transitionConfig.transitionOpacityDuration)
            .delay(transitionConfig.transitionOpacityDelay)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(animation) {
                opacityAnimation = isAppear
            }
        }
    }
    
    private func animatableYOffset(position: Tooltip.Position) -> CGFloat {
        switch position {
        case .top:
            return offsetAnimation ? 0 : transitionConfig.transitionYOffset
        case .bottom:
            return offsetAnimation ? 0 : -transitionConfig.transitionYOffset
        }
    }
    
    private func tooltipYOffset(_ frame: CGRect, tooltip: Tooltip) -> CGFloat {
        switch tooltip.position {
        case .top:
            return frame.minY - (tooltip.config.arrowHeight + tooltip.config.arrowPadding + tooltipContentHeight)
        case .bottom:
            return frame.maxY + tooltip.config.arrowHeight + tooltip.config.arrowPadding
        }
    }
    
    private func arrowXOffset(_ frame: CGRect, config: TooltipConfig) -> CGFloat {
        let potentialOffset = frame.midX - (config.arrowWidth / 2)
        let minOffset = config.screenPadding + config.borderRadius
        let maxOffset = UIScreen.main.bounds.width - (config.screenPadding + config.borderRadius + config.arrowWidth)
        
        return max(min(maxOffset, potentialOffset), minOffset)
    }
    
    private func arrowYOffset(_ frame: CGRect, tooltip: Tooltip) -> CGFloat {
        switch tooltip.position {
        case .top:
            return frame.minY - (tooltip.config.arrowHeight + tooltip.config.arrowPadding)
        case .bottom:
            return frame.maxY + tooltip.config.arrowPadding
        }
    }
    
    private func arrowRotation(position: Tooltip.Position) -> Angle {
        switch position {
        case .top:
            return Angle(degrees: 180)
        case .bottom:
            return Angle(degrees: 0)
        }
    }
    
}
