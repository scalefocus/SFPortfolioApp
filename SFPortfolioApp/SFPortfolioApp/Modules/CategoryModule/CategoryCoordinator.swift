//
//  CategoryCoordinator.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 2.07.21.
//

import SFBaseKit

class CategoryCoordinator: Coordinator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Functions
    override func start() {
        startCategoryScene()
    }
    
    // MARK: - Private Functions
    private func startCategoryScene() {
        let categoriesViewController = CategoryViewController.create(with: Category.allCases,
                                                                     delegate: self)
        navigationController.pushViewController(categoriesViewController, animated: true)
    }
    
}

// MARK: - CategoryViewModelCoordinatorDelegate
extension CategoryCoordinator: CategoryViewModelCoordinatorDelegate {
    
    func didFinishCategorySceneWithSelection(of category: Category) {
        let categoryItemsViewController = CategoryItemsViewController.create(with: CategoryItem.allCases,
                                                                             delegate: self)
        navigationController.pushViewController(categoryItemsViewController, animated: true)
    }
    
}

// MARK: - CategoryItemsViewModelCoordinatorDelegate
extension CategoryCoordinator: CategoryItemsViewModelCoordinatorDelegate {
    
    func didFinishCategoryItemsSceneWithSelection(of item: CategoryItem) {
    }
    
}
