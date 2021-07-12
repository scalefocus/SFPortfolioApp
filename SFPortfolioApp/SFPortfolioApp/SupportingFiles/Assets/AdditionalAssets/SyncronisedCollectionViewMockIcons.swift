//
//  SyncronisedCollectionViewMockIcons.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 6.07.21.
//

import Foundation

enum SyncronisedCollectionViewMockIcons: String, CaseIterable {
    
    case cocktails
    case deserts
    case fish
    case icecream
    case liquor
    case meat
    case pasta
    case pizza
    case snacks
    case soda
    case sushi
    case sweets
    case wine
    
    // MARK: - Properties
    var text: String {
        switch self {
        case .cocktails: return "Cocktails"
        case .deserts: return "Deserts"
        case .fish: return "Fish"
        case .icecream: return "Ice cream"
        case .liquor: return "Liquor"
        case .meat: return "Meat"
        case .pasta: return "Pasta"
        case .pizza: return "Pizza"
        case .snacks: return "Appetizers"
        case .soda: return "Soft drinks"
        case .sushi: return "Sushi"
        case .sweets: return "Sweets"
        case .wine: return "Wine"
        }
    }
    
    var image: String { rawValue }
    
}
