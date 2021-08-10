//
//  ModalView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 10.08.21.
//

import SwiftUI

struct ModalView<Content: View, ModalContent: View>: View {
    
    let isPresented: Bool
    let content: () -> Content
    let modalContent: () -> ModalContent
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            content()
                .zIndex(0)
            modalContent()
                .zIndex(1)
                .show(if: isPresented)
        }
    }
    
}
