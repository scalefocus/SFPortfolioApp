//
//  CategoryItemsViewController.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

class CategoryItemsViewController: BaseViewController {
    
    // MARK: - Properties
    private var viewModel: CategoryItemsViewModelProtocol!
    
    // MARK: - IBOutlets
    @IBOutlet private weak var categoryItemsTableView: UITableView! {
        didSet {
            categoryItemsTableView.register(cellNames: CategoryItemTableViewCell.typeName)
        }
    }
    
}

// MARK: - UITableViewDelegate
extension CategoryItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectItem(at: indexPath.row)
    }
    
}

// MARK: - UITableViewDataSource
extension CategoryItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCellsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configurator = viewModel.viewConfigurator(at: indexPath.row,
                                                            in: indexPath.section) else {
            return UITableViewCell()
        }
        return tableView.configureCell(for: configurator, at: indexPath)
    }
    
}

// MARK: - Instantiate
extension CategoryItemsViewController {
    
    /// Create view controller.
    /// - Parameters:
    ///   - items: Items to configure view model.
    ///   - delegate: View model coordinator delegate.
    /// - Returns: Configured CategoryItems view controller.
    static func create(with category: Category,
                       delegate: CategoryItemsViewModelCoordinatorDelegate) -> UIViewController {
        let viewController = CategoryItemsViewController()
        let viewModel = CategoryItemsViewModel(category: category)
        viewModel.delegate = delegate
        viewController.viewModel = viewModel
        return viewController
    }
    
}
