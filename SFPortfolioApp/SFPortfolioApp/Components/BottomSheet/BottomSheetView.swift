//
//  BottomSheetView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

struct BottomSheetView<T: BottomSheetViewModelProtocol, Content: View>: View {
    
    // MARK: - Configuration
    @ObservedObject var viewModel: T
    @Binding var isPresented: Bool
    let config: BottomSheetConfig
    let content: () -> Content
    
    // MARK: - State
    @Environment(\.statusBarUtility) var statusBarUtility: StatusBarUtility
    @State private var contentHeight: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var safeAreaHeight: CGFloat = 0
    @State private var dimmerBackgroundVisible = false
    @State private var contentFrame: CGRect = .zero
    
    // MARK: - Private properties
    private var defaultAnimation: Animation {
        .easeIn(duration: config.animationDuration)
    }
    
    // MARK: - Main View
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                dimmedBackgroundView
                    .zIndex(0)
                sheetView
                    .zIndex(1)
            }
            .onAppear {
                safeAreaHeight = geometry.safeAreaInsets.bottom
                dimmerBackgroundVisible = true
            }
            .edgesIgnoringSafeArea(.all)
        }
        .onReceive(viewModel.onItemSelectSubject, perform: closeBottomSheetView)
    }
    
}

// MARK: - Private Views
extension BottomSheetView {
    
    private var dimmedBackgroundView: some View {
        Color.black
            .opacity(backgroundOpacity)
            .animation(defaultAnimation, value: backgroundOpacity)
            .onTapGesture(perform: closeBottomSheetView)
    }
    
    private var sheetView: some View {
        VStack(spacing: 0) {
            dragIndicatorView
            headerView
                .show(if: hasHeader)
            ScrollView {
                content()
                    .background(measurerView)
            }
            .frame(width: UIScreen.main.bounds.width, height: height)
        }
        .onPreferenceChange(BottomSheetHeightPreferenceKey.self) { newValue in
            DispatchQueue.main.async {
                contentHeight = newValue
            }
        }
        .padding(.bottom, safeAreaHeight)
        .background(Color.white.cornerRadius(12, corners: [.topLeft, .topRight]))
        .offset(y: isPresented ? offset : height + safeAreaHeight)
        .animation(defaultAnimation, value: height + safeAreaHeight)
    }
    
    
    
    private var dragIndicatorView: some View {
        Group {
            RoundedRectangle(cornerRadius: 2)
                .fill(config.dragIndicatorForegroundColor)
                .frame(width: config.dragIndicatorWidth, height: config.dragIndicatorHeight)
                .padding(.vertical, config.dragIndicatorVerticalPadding)
        }
        .frame(width: UIScreen.main.bounds.width, height: config.handleHeight)
        .background(dragIndicatorBackgroundView)
        .cornerRadius(config.dragIndicatorCornerRadius, corners: [.topLeft, .topRight])
        .gesture(indicatorDragGesture)
        
    }

    private var headerView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(headerViewTitle)
                .font(config.headerTitleFont)
                .foregroundColor(config.headerTitleForegroundColor)
                .padding(.horizontal, 16)
            Spacer()
            separatorView
                .show(if: config.hasHeaderSeparator)
        }
        .frame(height: config.headerHeight)
        .background(config.headerBackgroundColor)
    }
    
    private var dragIndicatorBackgroundView: some View {
        hasHeader || config.isFirstItemSelected
            ? config.selectedItemBackgroundColor
            : config.defaultItemBackgroundColor
    }
    
    private var separatorView: some View {
        Rectangle()
            .foregroundColor(config.headerSeparatorForegroundColor)
            .frame(height: 1)
    }
    
    private var measurerView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: BottomSheetHeightPreferenceKey.self, value: geometry.size.height)
        }
    }
    
    private var indicatorDragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged(onChangedDragGestureValue)
            .onEnded(onEndedDragGestureValue)
    }
    
}

// MARK: - Helpers
extension BottomSheetView {
    
    private var maxHeight: CGFloat {
        UIScreen.main.bounds.width
            - statusBarUtility.statusBarHeight
            - headerViewHeight
            - safeAreaHeight
            - config.additionalTopPadding
            - config.handleHeight
            - Constants.General.navigationBarHeight
    }
    
    private var height: CGFloat {
        min(contentHeight, maxHeight)
    }
    
    private var hasHeader: Bool {
        viewModel.bottomSheetHeader != nil
    }
    
    private var headerViewTitle: String {
        viewModel.bottomSheetHeader ?? ""
    }
    
    private var headerViewHeight: CGFloat {
        hasHeader ? config.headerHeight : 0
    }
    
    private var backgroundOpacity: Double {
        dimmerBackgroundVisible ? config.dimmedBackgroundOpacity : 0
    }
    
    private func onChangedDragGestureValue(_ value: DragGesture.Value) {
        if value.translation.height > 0 {
            offset = value.translation.height
        }
    }
    
    private func onEndedDragGestureValue(_ value: DragGesture.Value) {
        if value.predictedEndTranslation.height > 100 {
            closeBottomSheetView()
        } else {
            offset = 0
        }
    }
    
    private func closeBottomSheetView() {
        withAnimation(defaultAnimation) {
            dimmerBackgroundVisible = false
            offset = height + safeAreaHeight
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + config.animationDuration) {
            isPresented = false
        }
    }
    
}
