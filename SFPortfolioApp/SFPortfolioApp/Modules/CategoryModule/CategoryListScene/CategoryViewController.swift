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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoriesCell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.typeName,
                                                                 for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        
        return categoriesCell
    }
    
}
