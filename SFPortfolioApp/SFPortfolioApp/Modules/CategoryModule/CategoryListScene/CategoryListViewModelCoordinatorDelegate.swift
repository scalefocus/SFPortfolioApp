//
//  CategoryViewModelCoordinatorDelegate.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 5.07.21.
//

import Foundation

protocol CategoryListViewModelCoordinatorDelegate: AnyObject {
    
    /// Navigate to `CategoryItemsScene`.
    /// - Parameter category: Selected `Category`
    func didFinishCategorySceneWithSelection(of category: Category)
    
}
