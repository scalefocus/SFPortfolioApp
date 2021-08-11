//
//  ExecutionButtonDemoView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 11.08.21.
//

import SwiftUI

struct ExecutionButtonDemoView: View {
    
    // MARK: - View Model
    @ObservedObject var defaultViewModel: ExecutionButtonDemoViewModel
    @ObservedObject var disabledViewModel: ExecutionButtonDemoViewModel
    
    // MARK: - Main View
    var body: some View {
        VStack(spacing: 60) {
            defaultButtonView
            disabledButtonView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .primaryBackground
        .primaryNavigationBarSetup(with: defaultViewModel.title)
    }
    
}

// MARK: - Private Views
extension ExecutionButtonDemoView {
    
    private var defaultButtonView: some View {
        VStack(spacing: 5) {
            HStack {
                infoLabel(with: defaultViewModel.defaultInfoLabelTitle)
                Spacer()
            }
            ExecutionButton(viewModel: defaultViewModel, config: config)
        }
    }
    
    private var disabledButtonView: some View {
        VStack(alignment: .leading, spacing: 5) {
            infoLabel(with: disabledViewModel.disabledInfoLabelTitle)
            ExecutionButton(viewModel: disabledViewModel, config: config)
        }
    }
    
    private var config: ExecutionButtonConfig {
        ExecutionButtonConfig(imageName: "arrow-right",
                              font: .custom(size: 18),
                              defaultTextForegroundColor: Color.black.opacity(0.75),
                              disabledTextForegroundColor: Color.black.opacity(0.6),
                              defaultBackgroundFillColor: .yellow,
                              disabledBackgroundFillColor: Color.gray.opacity(0.4),
                              defaultBackgroundShadowColor: .gray,
                              disabledBackgroundShadowColor: .gray,
                              defaultArrowSliderMultiplyColor: .yellow,
                              disabledArrowSliderMultiplyColor: Color.gray.opacity(0.2),
                              loadingSpinnerLineColor: .black)
    }
    
    private func infoLabel(with title: String) -> some View {
        Text(title)
            .font(.custom(size: 18))
            .foregroundColor(Color.black.opacity(0.7))
            .padding(.leading, 16)
    }
    
}

// MARK: - Preview
struct ExecutionButtonDemoView_Previews: PreviewProvider {
    
    static let defaultViewModel = ExecutionButtonDemoViewModel(executionButtonState: .default)
    static let disabledViewModel = ExecutionButtonDemoViewModel(executionButtonState: .disabled)
    
    static var previews: some View {
        ExecutionButtonDemoView(defaultViewModel: defaultViewModel, disabledViewModel: disabledViewModel)
    }
    
}
