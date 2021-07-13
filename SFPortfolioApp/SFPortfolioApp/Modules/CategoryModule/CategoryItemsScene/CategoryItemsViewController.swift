//
//  CategoryItemsViewController.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 30.06.21.
//

import SFBaseKit

class CategoryItemsViewController: BaseViewController {
    
    // MARK: - Properties
    private var viewModel: CategoryItemsViewModelProtocol! {
        didSet {
            title = viewModel.title
        }
    }
    private var isScrolledDown = true
    private var lastContentOffset: CGFloat = .zero
    // MARK: - IBOutlets
    @IBOutlet private weak var categoryItemsTableView: UITableView! {
        didSet {
            categoryItemsTableView.register(cellNames: CategoryItemTableViewCell.typeName)
            categoryItemsTableView.backgroundView = UIImageView(image: UIImage.background)
        }
    }
    
    // MARK: - Private Functions
    /// Animates table view cell to appear from top or bottom of the table view depending of scrolling direction.
    /// - Parameters:
    ///   - cell: Cell to animate.
    ///   - duration: The total duration of the animation.
    ///   - delay: The amount of time to wait before beginning the animation.
    private func animate(_ view: UIView, duration: TimeInterval, delay: TimeInterval) {
        let distanceToMove = (isScrolledDown ? 1 : -1) * view.frame.height / 2
        view.center.y = view.center.y + distanceToMove
        view.alpha = 0
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut]) {
            view.center.y = view.center.y - distanceToMove
            view.alpha = 1
        }
    }
    
}

// MARK: - UITableViewDelegate
extension CategoryItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectItem(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.openSans]
        return "\n\n".size(withAttributes: attributes).height
    }
    
}

// MARK: - UIScrollViewDelegate
extension CategoryItemsViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isScrolledDown = scrollView.contentOffset.y > lastContentOffset
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        animate(cell, duration: Constants.cellAnimationDuration, delay: Constants.cellAnimationDelay)
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
