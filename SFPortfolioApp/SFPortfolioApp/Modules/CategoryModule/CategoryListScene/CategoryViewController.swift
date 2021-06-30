//
//  CategoryViewController.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import SFBaseKit

class CategoryViewController: BaseViewController {

    // MARK: - IBOUtlets
    @IBOutlet private weak var categoriesTableView: UITableView! {
        didSet {
            categoriesTableView.register(cellNames: CategoryTableViewCell.typeName)
        }
    }
    
    // MARK: - Private Properties
    private var viewModel: CategoryViewModelProtocol!
    
}

// MARK: - UITableViewDelegate
extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfCellsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellConfigurator = viewModel?.viewConfigurator(at: indexPath.row,
                                                                 in: indexPath.section) else {
            return UITableViewCell()
        }
        
        return tableView.configureCell(for: cellConfigurator, at: indexPath)
    }
    
}

// MARK: - Instantiate
extension CategoryViewController {
    
    /// Create current ViewController.
    /// - Parameter viewModel: View model of the current ViewController.
    /// - Returns: configured ViewController.
    static func create(with viewModel: CategoryViewModelProtocol) -> UIViewController {
        let viewController = CategoryViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
