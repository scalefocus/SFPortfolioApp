//
//  TooltipDemoView.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 5.08.21.
//

import SwiftUI

struct TooltipDemoView: View {
    
    @ObservedObject var viewModel: TooltipDemoViewModel
    
    var body: some View {
        HStack(spacing: 50) {
            RoundedButtonView(title: "Hit me!") { viewModel.onActivateButtonTap(identity: .primary) }
                .tooltipElement(handler: viewModel.primaryHandler, identity: .primary)
            RoundedButtonView(title: "Hit me, too!") { viewModel.onActivateButtonTap(identity: .secondary) }
                .tooltipElement(handler: viewModel.secondaryHandler, identity: .secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .primaryBackground
        .primaryNavigationBarSetup(with: viewModel.title)
        .tooltipApplicable(handler: viewModel.primaryHandler)
        .tooltipApplicable(handler: viewModel.secondaryHandler)
    }
    
}

struct TooltipDemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        TooltipDemoView(viewModel: TooltipDemoViewModel())
    }
}
