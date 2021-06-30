//
//  CategoryViewModelCoordinatorDelegate.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 5.07.21.
//

import Foundation

protocol CategoryViewModelCoordinatorDelegate: AnyObject {
    
    /// Navigate to CategoryItems scene.
    /// - Parameter category: <#category description#>
    func didFinishCategorySceneWithSelection(of category: Category)
    
}
