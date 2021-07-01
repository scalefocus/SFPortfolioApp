//
//  CategoryItemsViewController.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

class CategoryItemsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var categoryItemsTableView: UITableView! {
        didSet {
            categoryItemsTableView.register(cellNames: CategoryItemTableViewCell.identifier)
        }
    }
    
}

// MARK: - UITableViewDelegate
extension CategoryItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension CategoryItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Change after implement the actual data source
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CategoryItemTableViewCell.identifier, for: indexPath)
    }
    
}
