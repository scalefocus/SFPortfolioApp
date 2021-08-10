//
//  BottomSheetViewModel.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import Combine

/// Protocol defining needed functionality for handling a bottom sheet.
protocol BottomSheetViewModelProtocol: ObservableObject {
    
    /// Optional title of bottom sheet's header.
    var bottomSheetHeader: String? { get }
    
    /// `PassthroughSubject` listening for item selection.
    var onItemSelectSubject: PassthroughSubject<Void, Never> { get }
    
}

/// Default implementation of `BottomSheetViewModelProtocol`.
extension BottomSheetViewModelProtocol {
    
    var bottomSheetHeader: String? { nil }
    
}
