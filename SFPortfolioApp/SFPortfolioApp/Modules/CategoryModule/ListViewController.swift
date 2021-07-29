//
//  ListViewController.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import SFBaseKit

class ListViewController: BaseViewController {
    
    // MARK: - Properties
    private var isScrolledDown = true
    private var lastContentOffset: CGFloat = .zero
    private var viewModel: ListViewModelProtocol! {
        didSet {
            title = viewModel.title
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var categoriesTableView: UITableView! {
        didSet {
            categoriesTableView.register(cellNames: viewModel.reuseIdentifiers)
            categoriesTableView.backgroundView = UIImageView(image: UIImage.background)
        }
    }
    
    // MARK: - Private Functions
    /// Animates table view cell to appear from top or bottom of the table view depending of scrolling direction.
    /// - Parameters:
    ///   - view: View to animate.
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
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let configurator = viewModel.viewConfigurator(at: indexPath.row, in: indexPath.section) else { return }
        configurator.didSelectAction?()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.openSans]
        return "\n\n".size(withAttributes: attributes).height
    }
    
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfCellsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellConfigurator = viewModel?.viewConfigurator(at: indexPath.row, in: indexPath.section) else {
            return UITableViewCell()
        }
        return tableView.configureCell(for: cellConfigurator, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        animate(cell, duration: Constants.cellAnimationDuration, delay: Constants.cellAnimationDelay)
    }
    
}

// MARK: - UIScrollViewDelegate
extension ListViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isScrolledDown = scrollView.contentOffset.y > lastContentOffset
    }
    
}

// MARK: - Instantiate
extension ListViewController {
    
    /// Create category list view controller.
    /// - Parameter viewModel: View model to configure view with.
    /// - Returns: Configured List view controller.
    static func create(viewModel: ListViewModelProtocol) -> UIViewController {
        let viewController = ListViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
