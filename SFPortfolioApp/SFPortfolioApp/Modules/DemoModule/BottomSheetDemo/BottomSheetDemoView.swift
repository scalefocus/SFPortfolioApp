//
//  BottomSheetDemoView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 11.08.21.
//

import SwiftUI

struct BottomSheetDemoView: View {
    
    // MARK: - View Model
    @ObservedObject var viewModel: BottomSheetDemoViewModel
    
    // MARK: - Main View
    var body: some View {
        countrySelectionView
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(mainBackgroundView)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(viewModel.title)
            .modalView(isPresented: viewModel.isCountrySelectionPresented, modalContent: { bottomSheetView })
    }
    
}

// MARK: - Private Views
extension BottomSheetDemoView {
    
    private var mainBackgroundView: some View {
        Image(uiImage: .background)
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
    
    private var countrySelectionView: some View {
        VStack(spacing: 0) {
            countryInfoView
            separatorView
        }
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
        .onTapGesture(perform: viewModel.onCountryDropDownTap)
    }
    
    private var countryInfoView: some View {
        ZStack(alignment: .leading) {
            HStack {
                Text(viewModel.selectedCountryName)
                    .font(.custom(size: 20))
                Spacer()
                Image("arrow-down")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(viewModel.isCountrySelectionPresented ? 180 : 0))
                    .animation(.linear, value: viewModel.isCountrySelectionPresented)
            }
            Text(viewModel.countryNamePlaceholder)
                .font(.custom(size: viewModel.shouldOffsetPlaceholder ? 15 : 20))
                .foregroundColor(Color.black.opacity(0.75))
                .offset(y: viewModel.shouldOffsetPlaceholder ? -34 : 0)
                .animation(.linear(duration: 0.15), value: viewModel.shouldOffsetPlaceholder)
        }
        .padding(.vertical, 28)
        .foregroundColor(Color.black.opacity(0.75))
    }
    
    private var separatorView: some View {
        Rectangle()
            .foregroundColor(.gray)
            .frame(height: 0.5)
    }
    
    private var bottomSheetView: some View {
        BottomSheetView(viewModel: viewModel,
                        isPresented: $viewModel.isCountrySelectionPresented,
                        config: bottomSheetConfig,
                        content: { bottomSheetContentView })
    }
    
    private var bottomSheetContentView: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.countries, id: \.self) { country in
                VStack(spacing: 0) {
                    Text(country)
                        .font(.custom(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)
                    separatorView
                }
                .padding(.horizontal, 16)
                .background(background(for: country))
                .onTapGesture { viewModel.onCountrySelect(country) }
            }
        }
        .padding(.bottom, 2)
    }
    
    private var bottomSheetConfig: BottomSheetConfig {
        BottomSheetConfig(defaultItemBackgroundColor: Color.black.opacity(0.1),
                          selectedItemBackgroundColor: Color.black.opacity(0.2),
                          dragIndicatorForegroundColor: Color.black.opacity(0.2))
    }
    
    private func background(for country: String) -> some View {
        let opacity = viewModel.isCountrySelected(country) ? 0.2 : 0.1
        return Color.black.opacity(opacity)
    }
    
}

// MARK: - Preview
struct BottomSheetDemoView_Previews: PreviewProvider {
    
    static let viewModel = BottomSheetDemoViewModel()
    
    static var previews: some View {
        BottomSheetDemoView(viewModel: viewModel)
    }
    
}
