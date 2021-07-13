//
//  CategoryItemsViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

class CategoryItemsListViewModel: ListViewModelProtocol {
    
    typealias CategoryItemViewConfigurator = BaseViewConfigurator<CategoryItemTableViewCell>
    
    // MARK: - Properties
    let title: String
    var reuseIdentifiers: [String] {
        [CategoryItemViewConfigurator.reuseIdentifier]
    }
    weak var delegate: CategoryItemsListViewModelCoordinatorDelegate?
    private let categoryItems: [CategoryItem]
    
    // MARK: - Initializers
    init(category: Category) {
        self.categoryItems = category.categoryItems
        self.title = category.title
    }
    
    // MARK: - Public Methods
    func numberOfCellsInSection(_ section: Int) -> Int? {
        return categoryItems.count
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        guard let title = categoryItems[safeAt: index]?.title else {
            return nil
        }
        let cellViewModel = CategoryItemTableViewCellViewModel(title: title)
        return CategoryItemViewConfigurator(data: cellViewModel) { [weak self] in
            self?.selectItem(at: index)
        }
    }
    
    // MARK: - Private Functions
    private func selectItem(at index: Int) {
        guard let item = categoryItems[safeAt: index] else { return }
        delegate?.didFinishCategoryItemsSceneWithSelection(of: item)
    }
    
}
