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
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Functions
    override func start() {
        startCategoryScene()
    }
    
    // MARK: - Private Functions
    private func startCategoryScene() {
        let viewModel = CategoryListViewModel(categories: Category.allCases)
        viewModel.delegate = self
        let categoriesViewController = ListViewController.create(viewModel: viewModel)
        navigationController.pushViewController(categoriesViewController, animated: true)
    }
    
}

// MARK: - CategoryViewModelCoordinatorDelegate
extension CategoryCoordinator: CategoryListViewModelCoordinatorDelegate {
    
    func didFinishCategorySceneWithSelection(of category: Category) {
        let viewModel = CategoryItemsListViewModel(category: category)
        viewModel.delegate = self
        let categoryItemsViewController = ListViewController.create(viewModel: viewModel)
        navigationController.pushViewController(categoryItemsViewController, animated: true)
    }
    
}

// MARK: - CategoryItemsViewModelCoordinatorDelegate
extension CategoryCoordinator: CategoryItemsListViewModelCoordinatorDelegate {
    
    func didFinishCategoryItemsSceneWithSelection(of item: CategoryItem) {
        switch item {
        case .synchronisedCollectionView:
            let configurator = SynchronisedCollectionViewsLayoutConfigurator(numberOfItemsInPortrait: 5)
            let viewModel = SynchronisedCollectionViewsViewModel(iconsCollection: SyncronisedCollectionViewMockIcons.allCases)
            
            let synchronisedCollectionViewsViewController = SynchronisedCollectionViewsViewController.create(viewModel: viewModel,
                                                                                                             with: configurator)
            navigationController.pushViewController(synchronisedCollectionViewsViewController, animated: true)
        case .asymmetricCollectionView:
            let asymmetricCollectionDemoCoordinator = AsymmetricCollectionDemoCoordinator(navigationController: navigationController)
            addChildCoordinator(asymmetricCollectionDemoCoordinator)
            asymmetricCollectionDemoCoordinator.start()
        }
    }
    
}
