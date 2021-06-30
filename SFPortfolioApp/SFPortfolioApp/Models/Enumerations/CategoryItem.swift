//
//  CategoryItem.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 1.07.21.
//

import Foundation

enum CategoryItem: CaseIterable {
    
    case synchronisedCollectionView
    case asymmetricCollectionView
    
    // MARK: - Properties
    var title: String {
        switch self {
        case .synchronisedCollectionView:
            return "Synchronised Collection View"
        case .asymmetricCollectionView:
            return "Asymmetric Collection View"
        }
    }
    
}
