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
        let viewController = ListViewController.create(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startSynchronisedCollectionViewScene() {
        let configurator = SynchronisedCollectionViewsLayoutConfigurator(numberOfItemsInPortrait: 5)
        let iconsCollection = SyncronisedCollectionViewMockIcons.allCases
        let title = Constants.CategoryItemTitle.synchronisedCollectionView
        let viewModel = SynchronisedCollectionViewsViewModel(title: title, iconsCollection: iconsCollection)
        let viewController = SynchronisedCollectionViewsViewController.create(viewModel: viewModel, with: configurator)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startAsymmetricCollectionViewFlow() {
        let coordinator = AsymmetricCollectionDemoCoordinator(navigationController: navigationController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    private func startBottomSheetDemoScene() {
        let viewModel = BottomSheetDemoViewModel()
        let view = BottomSheetDemoView(viewModel: viewModel)
        let viewController = view.hostingController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startTooltipDemoScene() {
        let viewModel = TooltipDemoViewModel()
        let view = TooltipDemoView(viewModel: viewModel)
        let viewController = view.hostingController
        navigationController.pushViewController(viewController, animated: true)
    }

    private func startExecutionButtonDemoScene() {
        let defaultViewModel = ExecutionButtonDemoViewModel(executionButtonState: .default)
        let disabledViewModel = ExecutionButtonDemoViewModel(executionButtonState: .disabled)
        let view = ExecutionButtonDemoView(defaultViewModel: defaultViewModel, disabledViewModel: disabledViewModel)
        let viewController = view.hostingController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startCustomSegmentedControlDemoScene() {
        let view = SegmentedControlDemoView(primaryViewModel: SegmentedControlDemoViewModel(),
                                            secondaryViewModel: SegmentedControlDemoViewModel())
        let viewController = view.hostingController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startShimmerLoadingViewScene() {
        let view = ShimmerLoadingDemoView()
        let viewController = view.hostingController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startPieProgressIndicatorScene() {
        let viewModel = PieProgressIndicatorViewModel()
        let viewConfig = PieProgressIndicatorConfig()
        let view = PieProgressIndicatorDemoView(viewModel: viewModel, config: viewConfig)
        let viewController = view.hostingController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startMagicSliderDemoScene() {
        let primaryVerticalSliderViewModel = MagicSliderViewModel()
        let secondaryVerticalSliderViewModel = MagicSliderViewModel()
        let horizontalSliderViewModel = MagicSliderViewModel()
        let view = MagicSliderDemoView(primaryVerticalViewModel: primaryVerticalSliderViewModel,
                                       secondaryVerticalViewModel: secondaryVerticalSliderViewModel,
                                       horizontalViewModel: horizontalSliderViewModel)
        let viewController = view.hostingController
        navigationController.pushViewController(viewController, animated: true)
    }
        
    private func startScannerViewDemoScene() {
        let viewModel = ScannerDemoViewModel()
        navigationController.pushViewController(ScannerDemoViewController.create(viewModel: viewModel), animated: true)
    }
    
}

// MARK: - CategoryViewModelCoordinatorDelegate
extension CategoryCoordinator: CategoryListViewModelCoordinatorDelegate {
    
    func didFinishCategorySceneWithSelection(of category: Category) {
        let viewModel = CategoryItemsListViewModel(category: category)
        viewModel.delegate = self
        let viewController = ListViewController.create(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - CategoryItemsViewModelCoordinatorDelegate
extension CategoryCoordinator: CategoryItemsListViewModelCoordinatorDelegate {
    
    func didFinishCategoryItemsSceneWithSelection(of item: CategoryItem) {
        switch item {
        case .synchronisedCollectionView:
            startSynchronisedCollectionViewScene()
        case .asymmetricCollectionView:
            startAsymmetricCollectionViewFlow()
        case .bottomSheet:
            startBottomSheetDemoScene()
        case .tooltipView:
            startTooltipDemoScene()
        case .executionButton:
            startExecutionButtonDemoScene()
        case .customSegmentedControl:
            startCustomSegmentedControlDemoScene()
        case .shimmerLoadingView:
            startShimmerLoadingViewScene()
        case .pieProgressIndicator:
            startPieProgressIndicatorScene()
        case .magicSliderView:
            startMagicSliderDemoScene()
        case .scannerView:
            startScannerViewDemoScene()
        }
    }
    
}
