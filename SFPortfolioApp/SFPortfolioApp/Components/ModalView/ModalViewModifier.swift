//
//  ModalViewModifier.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

extension View {
    
    /// View extension function provided for more readable and convenient usage of `TooltipElementModifier`.
    ///
    /// - Parameters:
    ///   - isPresented: Bool value indicating whether the modal view should be shown.
    ///   - modalContent: The modal view to be shown.
    ///
    /// - Returns: The modified and subscribed view for showing a modal content.
    func modalView<ModalContent: View>(isPresented: Bool,
                                       modalContent: @escaping () -> ModalContent) -> some View {
        modifier(ModalViewModifier(isPresented: isPresented, modalContent: modalContent))
    }
    
}

/// A view modifier used for showing a custom modal content view from the bottom.
struct ModalViewModifier<ModalContent: View>: ViewModifier {
    
    let isPresented: Bool
    let modalContent: () -> ModalContent
    
    func body(content: Content) -> some View {
        ModalView(isPresented: isPresented,
                  content: { content },
                  modalContent: modalContent)
    }
    
}
