//
//  CategoryItemsViewModelCoordinatorDelegate.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.07.21.
//

import Foundation

protocol CategoryItemsViewModelCoordinatorDelegate: AnyObject {
    
    /// Navigate to ItemDemo scene.
    /// - Parameter item: Category item model to configure the scene with.
    func didFinishCategoryItemsSceneWithSelection(of item: CategoryItem)
    
}
