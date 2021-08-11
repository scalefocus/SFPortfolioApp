//
//  BottomSheetDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 11.08.21.
//

import Combine

class BottomSheetDemoViewModel: BottomSheetViewModelProtocol {
    
    // MARK: - Published
    @Published var isCountrySelectionPresented = false
    
    // MARK: - Subjects
    let onItemSelectSubject = PassthroughSubject<Void, Never>()
    
    // MARK: - Properties
    var selectedCountryName: String {
        selectedCountry ?? countryNamePlaceholder
    }
    
    var shouldOffsetPlaceholder: Bool {
        selectedCountry != nil
    }
    
    let countries = ["England", "Germany", "Italy", "France"]
    let title: String = Constants.CategoryItemTitle.bottomSheet
    let countryNamePlaceholder = "Select a country: "
    private var selectedCountry: String?
    
    // MARK: - Actions
    func onCountryDropDownTap() {
        isCountrySelectionPresented = true
    }
    
    func onCountrySelect(_ country: String) {
        selectedCountry = country
        onItemSelectSubject.send()
    }
    
    func isCountrySelected(_ country: String) -> Bool {
        selectedCountry == country
    }
    
}
