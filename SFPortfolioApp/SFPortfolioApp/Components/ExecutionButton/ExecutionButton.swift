//
//  ExecutionButton.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 10.08.21.
//

import SwiftUI

struct ExecutionButton<T: ExecutionButtonViewModelProtocol>: View {
    
    // MARK: - Configuration
    @ObservedObject var viewModel: T
    let config: ExecutionButtonConfig
    
    // MARK: - State
    @State private var width: CGFloat = 0
    @State private var timer: Timer?
    @State private var showTextAnimation = false
    @State private var percentageProgress: Double = 0
    @State private var spacerWidth: CGFloat = 0
    @State private var buttonColor: Color = .white
    @State private var chevronRotation: Double = 0
    @State private var loadingSpinnerRotation: Double = 0
    
    // MARK: - Private properties
    private let height: CGFloat = 72
    private let arrowSliderInset: CGFloat = 8
    private let spacerAnimationDuration: Double = 0.3
    
    // MARK: - Main View
    var body: some View {
        ZStack(alignment: .center) {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: spacerWidth, height: height)
                buttonBackground
                    .frame(minWidth: arrowSliderDiameter + (arrowSliderInset * 2))
            }
            
            textBody
                .show(if: !viewModel.isExecutionButtonLoading)
            
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: spacerWidth, height: height)
                arrowSliderButton
                Spacer(minLength: arrowSliderInset)
            }
            
            // By examples this was being set as background, but it has issues with the initial preference
            // value when view is reloaded, therefore it's set as a view in the stack.
            // This way we are adapting GeometryReader's functionality to return the proposed
            // size by the parent (the ZStack container), which results in dynamically getting the proposed width.
            widthSetterView
        }
        .frame(minWidth: minWidth,
               maxWidth: maxWidth,
               minHeight: height,
               idealHeight: height,
               maxHeight: height,
               alignment: .center)
        .onPreferenceChange(ExecutionButtonWidthPreferenceKey.self) { newValue in
            DispatchQueue.main.async {
                width = newValue
            }
        }
        .disabled(state == .disabled)
        .onReceive(viewModel.executionButtonResetSubject, perform: resetPosition)
        .onAppear(perform: start)
    }
    
}

// MARK: - Private Views
extension ExecutionButton {
    
    private var buttonBackground: some View {
        RoundedRectangle(cornerRadius: config.outerCornerRadius)
            .fill(buttonBackgroundFillColor)
            .shadow(color: buttonBackgroundShadowColor, radius: 3, x: 0, y: 0)
    }
    
    private var textBody: some View {
        HStack(spacing: 0) {
            Spacer()
            ZStack {
                Text(viewModel.executionText)
                    .frame(width: 191, height: 60)
                    .font(config.font)
                    .foregroundColor(executionTextForegroundColor)
                    .multilineTextAlignment(.center)
                
                // TODO: Temporary commented out. Check why `gradientView` suddenly
                // started interfering resizing calculations.
                // To be checked with [SPFA-34].
                /*
                gradientView
                    .frame(width: 191, height: 60)
                    .show(if: state == .default)
                 */
            }
            .offset(x: 16, y: 0)
            Spacer()
        }
        .opacity(1 - Double(spacerWidth / arrowSliderInset))
        .onAppear { showTextAnimation.toggle() }
    }
    
    private var gradientView: some View {
        Capsule()
            .fill(gradientFillView)
            .rotationEffect(.degrees(90))
            .offset(x: showTextAnimation ? 100 : -100)
            .animation(gradientAnimation)
            .mask(gradientMaskView)
    }
    
    private var gradientFillView: some ShapeStyle {
        LinearGradient(gradient: Gradient(colors: config.gradientFillColors),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    private var gradientMaskView: some View {
        Text(viewModel.executionText)
            .frame(width: 191, height: 60)
            .font(config.font)
            .multilineTextAlignment(.center)
    }
    
    private var arrowSliderButton: some View {
        ZStack {
            Circle()
                .shadow(radius: 2, x: 1, y: 1)
                .opacity(!viewModel.isExecutionButtonLoading ? 1 : 0)
            Image(config.imageName)
                .colorMultiply(arrowSliderMultiplyColor)
                .rotationEffect(Angle(degrees: chevronRotation))
                .opacity(!viewModel.isExecutionButtonLoading ? 1 : 0)
            loadingSpinnerView
        }
        .frame(width: arrowSliderDiameter, height: arrowSliderDiameter)
        .foregroundColor(buttonColor)
        .offset(x: arrowSliderInset, y: 0)
        .gesture(arrowSliderDragGesture)
    }
    
    private var loadingSpinnerView: some View {
        Circle()
            .trim(from: 0, to: 0.25)
            .stroke(config.loadingSpinnerLineColor, lineWidth: config.loadingSpinnerLineWidth)
            .rotationEffect(Angle(degrees: loadingSpinnerRotation))
            .clipShape(Circle())
            .opacity(viewModel.isExecutionButtonLoading ? 1 : 0)
            .padding(4)
    }
    
    private var arrowSliderDragGesture: some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .global)
            .onChanged { value in
                setCurrentPosition(shrinkSize: value.translation.width)
            }
            .onEnded { _ in
                guard percentageProgress >= config.triggerPercentage else {
                    resetPosition()
                    return
                }
                executeAction()
            }
    }
    
    private var widthSetterView: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ExecutionButtonWidthPreferenceKey.self, value: geometry.size.width)
                .onAppear {
                    DispatchQueue.main.async {
                        width = geometry.size.width
                    }
                }
        }
    }
    
}

// MARK: - Helpers
extension ExecutionButton {
    
    private var innerWidth: CGFloat {
        width - 2 * arrowSliderInset
    }
    
    private var arrowSliderDiameter: CGFloat {
        height - 2 * arrowSliderInset
    }
    
    private var minWidth: CGFloat {
        arrowSliderDiameter + 2 * arrowSliderInset
    }
    
    private var gradientAnimation: Animation {
        Animation.easeInOut(duration: 3).repeatForever(autoreverses: false)
    }
    
    private var state: ExecutionButtonState {
        viewModel.executionButtonState
    }
    
    private var buttonBackgroundFillColor: Color {
        state == .default ? config.defaultBackgroundFillColor : config.disabledBackgroundFillColor
    }
    
    private var buttonBackgroundShadowColor: Color {
        state == .default ? config.defaultBackgroundShadowColor : config.disabledBackgroundShadowColor
    }
    
    private var executionTextForegroundColor: Color {
        state == .default ? config.defaultTextForegroundColor : config.disabledTextForegroundColor
    }
    
    private var arrowSliderMultiplyColor: Color {
        state == .default ? config.defaultArrowSliderMultiplyColor : config.disabledArrowSliderMultiplyColor
    }
    
    private var maxWidth: CGFloat {
        viewModel.isExecutionButtonLoading ? minWidth : .infinity
    }
    
    private func start() {
        startLoadingSpinnerAnimation()
    }
    
    private func startLoadingSpinnerAnimation() {
        let animation = Animation
            .linear(duration: config.loadingSpinnerAnimationDuration)
            .repeatForever(autoreverses: false)
        withAnimation(animation) {
            loadingSpinnerRotation = 360
        }
    }
    
    private func setCurrentPosition(shrinkSize: CGFloat, completion: (() -> Void)? = nil) {
        /// Setup min and max clamping values so we don't drag the slider out of it's bounds.
        let arrowSlidingPadding: CGFloat = shrinkSize > 0 ? arrowSliderInset * 2 : 0
        let maxDragDistance: CGFloat = max(innerWidth - arrowSliderDiameter, 0)
        let tempDragDistance = max(arrowSlidingPadding, shrinkSize) - arrowSliderDiameter
        let tempSpaceWidth = min(tempDragDistance, maxDragDistance)
        
        /// Calculate current progress to manage animation's interactivity.
        percentageProgress = Double(tempSpaceWidth / maxDragDistance)
        
        /// Button colour and chevrons rotation animation values.
        buttonColor = (percentageProgress < config.triggerPercentage) ? Color.white.opacity(0.95) : Color.white
        
        /// Handle chevron rotation.
        let arrowAnimationProgress = max(0, percentageProgress - config.arrowAnimationPercentageTrigger)
        let calculatedDegrees = arrowAnimationProgress * 90 / (1 - config.arrowAnimationPercentageTrigger)
        chevronRotation = calculatedDegrees
        
        /// Perform animations,
        animateSpacerWidth(to: tempSpaceWidth + arrowSlidingPadding, completion: completion)
    }
    
    /// Animate the button by shrinking it based on the provided value.
    ///
    /// - Parameters:
    ///   - value: The value to use for shrink.
    ///   - completion: Completion to be executed when animation ends. Chain new animation here.
    private func animateSpacerWidth(to value: CGFloat, completion: (() -> Void)?) {
        withAnimation(.linear(duration: spacerAnimationDuration)) {
            spacerWidth = value
            
            /// For now we don't have a good way to chain animations in SwiftUI,
            /// that's why a timer is used. Check this next versions.
            guard completion != nil else { return }
            
            if timer == nil {
                timer = Timer.scheduledTimer(withTimeInterval: spacerAnimationDuration,
                                             repeats: false,
                                             block: { _ in completion?() })
            } else {
                timer?.fire()
            }
        }
    }
    
    private func startLoadingAnimation() {
        viewModel.isExecutionButtonLoading = true
        setCurrentPosition(shrinkSize: arrowSliderInset / 2) {
            spacerWidth = 0
        }
    }
    
    /// Start loading animation and trigger action.
    private func executeAction() {
        startLoadingAnimation()
        viewModel.executionAction()
    }
    
    /// Resets the button to the initial state
    func resetPosition() {
        viewModel.isExecutionButtonLoading = false
        timer?.invalidate()
        timer = nil
        setCurrentPosition(shrinkSize: 0)
    }
    
}
