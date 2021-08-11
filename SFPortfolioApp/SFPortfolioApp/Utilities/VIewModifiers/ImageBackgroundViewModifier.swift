//
//  ImageBackgroundViewModifier.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import SwiftUI

struct ImageBackgroundViewModifier: ViewModifier {
    
    let image: Image
    
    private var backgroundView: some View {
        image
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
    
    func body(content: Content) -> some View {
        content
            .background(backgroundView)
    }
    
}
