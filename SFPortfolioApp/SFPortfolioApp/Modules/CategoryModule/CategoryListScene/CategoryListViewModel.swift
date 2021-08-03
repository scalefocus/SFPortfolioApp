//
//  CategoryViewModel.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import SFBaseKit

class CategoryListViewModel: ListViewModelProtocol {
    
    typealias CategoryViewConfigurator = BaseViewConfigurator<CategoryItemTableViewCell>
    
    // MARK: - Properties
    var title: String {
        Constants.CategoryList.title
    }
    var reuseIdentifiers: [String] {
        [CategoryViewConfigurator.reuseIdentifier]
    }
    weak var delegate: CategoryListViewModelCoordinatorDelegate?
    private let categories: [Category]
    
    // MARK: - Inits
    init(categories: [Category]) {
        self.categories = categories
    }
    
    // MARK: - Public Functions
    func numberOfCellsInSection(_ section: Int) -> Int? {
        return categories.count
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        guard let categoryName = categories[safeAt: index]?.title else {
            return nil
        }
        let categoryCellViewModel = CategoryItemTableViewCellViewModel(title: categoryName, cellType: .category)
        return CategoryViewConfigurator(data: categoryCellViewModel) { [weak self] in
            self?.selectCategory(at: index)
        }
    }
    
    // MARK: - Private Functions
    private func selectCategory(at index: Int) {
        guard let category = categories[safeAt: index] else { return }
        delegate?.didFinishCategorySceneWithSelection(of: category)
    }
    
}
