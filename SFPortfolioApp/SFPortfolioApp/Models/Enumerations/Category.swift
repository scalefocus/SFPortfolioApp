//
//  Category.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import Foundation

enum Category: Int, CaseIterable {
    
    case collectionView
    case swiftUI
    
    // MARK: - Properties
    var title: String {
        switch self {
        case .collectionView:
            return "Collection View elements"
        case .swiftUI:
            return "SwiftUI elements"
        }
    }
    
}
