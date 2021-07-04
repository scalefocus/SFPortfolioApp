//
//  CategoryItemsViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

class CategoryItemsViewModel: CategoryItemsViewModelProtocol {
    
    typealias CategoryItemViewConfigurator = BaseViewConfigurator<CategoryItemTableViewCell>
    
    // MARK: - Properties
    let categoryItems: [CategoryItem]
    weak var delegate: CategoryItemsViewModelCoordinatorDelegate?
    
    // MARK: - Initializers
    init(categoryItems: [CategoryItem]) {
        self.categoryItems = categoryItems
    }
    
    // MARK: - Public Methods
    func selectItem(at index: Int) {
        guard let item = categoryItems[safeAt: index] else { return }
        delegate?.didFinishCategoryItemsSceneWithSelection(of: item)
    }
    
    func numberOfCellsInSection(_ section: Int) -> Int? {
        return categoryItems.count
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        guard let title = categoryItems[safeAt: index]?.title else {
            return nil
        }
        let cellViewModel = CategoryItemTableViewCellViewModel(title: title)
        let configurator = CategoryItemViewConfigurator(data: cellViewModel)
        return configurator
    }
    
}
