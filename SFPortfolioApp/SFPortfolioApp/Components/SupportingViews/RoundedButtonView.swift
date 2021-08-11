//
//  RoundedButtonView.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 11.08.21.
//

import SwiftUI

struct RoundedButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding(EdgeInsets(top: 12, leading: 30, bottom: 12, trailing: 30))
            .overlay(
                RoundedRectangle(cornerRadius: 22).stroke(Color.black, lineWidth: 1)
            )
    }
    
}
