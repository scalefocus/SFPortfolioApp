//
//  CategoryViewModel.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import SFBaseKit

class CategoryViewModel: CategoryViewModelProtocol {
    
    typealias CategoryViewConfigurator = BaseViewConfigurator<CategoryTableViewCell>
    
    // MARK: - Public Properties
    let categories: [Category]
    
    // MARK: - Inits
    init(categories: [Category]) {
        self.categories = categories
    }
    
    // MARK: - Public Functions
    func selectCategory(at index: Int) {

    }
    
    func numberOfCellsInSection(_ section: Int) -> Int? {
        return categories.count
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        guard let categoryName = categories[safeAt: index]?.title else {
            return nil
        }
        let categoryCellViewModel = CategoryTableViewCellViewModel(categoryName)
        let configurator = CategoryViewConfigurator(data: categoryCellViewModel)
        return configurator
    }
    
}
