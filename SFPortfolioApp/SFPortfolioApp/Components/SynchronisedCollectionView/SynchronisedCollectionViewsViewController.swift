//
//  SynchronisedCollectionViewsViewController.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 6.07.21.
//

import SFBaseKit

class SynchronisedCollectionViewsViewController: BaseViewController {

    // MARK: - Private Properties
    private var viewModel: SynchronisedCollectionViewsViewModelProtocol!
    private var configurator: SynchronisedCollectionViewsLayoutConfigurator!
    private var isScrolledRight = true
    private var lastContentOffset: CGFloat = .zero
    private var line = UIView()
    
    // MARK: - IBOutlets
    @IBOutlet private weak var iconsCollectionView: UICollectionView! {
        didSet {
            iconsCollectionView.register(cellNames: [TabBarCollectionViewCell.typeName])
        }
    }
    
    @IBOutlet private weak var iconDetailsCollectionView: UICollectionView! {
        didSet {
            iconDetailsCollectionView.register(cellNames: [DetailsCollectionViewCell.typeName])
        }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewsLayout()
        setupIconSelector()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupIconSelector()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        guard let selectedItemsArray = iconsCollectionView.indexPathsForSelectedItems else { return }
        
        var indexPath: IndexPath
        if selectedItemsArray.count == 0 {
            indexPath = IndexPath(item: 0, section: 0)
        } else {
            guard let firstIndex = iconsCollectionView.indexPathsForSelectedItems?.first else { return }
            indexPath = firstIndex
        }
        
        coordinator.animate { [weak self] context in
            self?.calculateIconsCollectionViewOffset(for: indexPath, and: size)
        }
    }
    
    // MARK: - Private Functions
    private func setupNavigationBar() {
        title = viewModel.title
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupCollectionViewsLayout() {
        iconsCollectionView.collectionViewLayout = SynchronisedCollectionViewsLayout(configurator: configurator)
        iconDetailsCollectionView.collectionViewLayout = SynchronisedCollectionViewsLayout(configurator: configurator)
    }
    
    private func setupIconSelector() {
        line.accessibilityIdentifier = Constants.AccessibilityIdentifier.syncronisedCollectionViewSelector
        line.backgroundColor = .white
        updateIconSelectorWidth()
        line.frame.size.height = 3
        line.frame.origin.y = iconsCollectionView.bounds.height - line.frame.size.height
        iconsCollectionView.addSubview(line)
        iconsCollectionView.bringSubviewToFront(line)
        line.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func updateIconSelectorWidth() {
        var numerator: CGFloat = .zero
        
        if let isOrientationInLandscape = isOrientationInLandscape() {
            numerator = isOrientationInLandscape
                ? view.frame.size.height
                : view.frame.size.width
        }
        line.frame.size.width = numerator / configurator.numberOfItemsInPortrait
    }
    
    /// Returns current device orientation.
    private func isOrientationInLandscape() -> Bool? {
        let deviceOrientationIsValid = UIDevice.current.orientation.isValidInterfaceOrientation
        
        if deviceOrientationIsValid {
            return UIDevice.current.orientation.isLandscape
        }
        
        if let interfaceOrientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation {
            return interfaceOrientation.isLandscape
        }
        
        return nil
    }
    
    /// Calculates the offset of both both collection views on device rotation and scrolls the top view to correct position.
    private func calculateIconsCollectionViewOffset(for indexPath: IndexPath, and size: CGSize) {
        let offset = iconDetailsCollectionView.contentOffset
        var newOffset = CGPoint(x: CGFloat(indexPath.row) * size.width, y: offset.y)
        
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            let insets = window.safeAreaInsets
            iconDetailsCollectionView.collectionViewLayout.invalidateLayout()
            newOffset.x = newOffset.x - ((insets.left + insets.right) * CGFloat(indexPath.row))
            iconDetailsCollectionView.setContentOffset(newOffset, animated: false)
            
            iconsCollectionView.collectionViewLayout.invalidateLayout()
            iconsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

}

// MARK: - UICollectionViewDelegate
extension SynchronisedCollectionViewsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == iconsCollectionView else { return }
        
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear) { [weak self] in
            guard let self = self else { return }
            
            self.line.backgroundColor = .white
            self.line.frame.origin.x = CGFloat(indexPath.row) * self.line.frame.size.width
            self.synchronizeCollectionView(self.iconDetailsCollectionView, index: indexPath.row)
        }
    }
    
    func synchronizeCollectionView(_ collectionViewToScroll: UICollectionView?, index: Int) {
        guard let collectionViewToScroll = collectionViewToScroll else { return }
        
        var scrollBounds = collectionViewToScroll.bounds
        scrollBounds.origin.x = CGFloat(index) * collectionViewToScroll.frame.size.width

        collectionViewToScroll.bounds = scrollBounds
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == iconsCollectionView {
            line.backgroundColor = .clear
        }
    }
    
}

// MARK: - UIScrollViewDelegate
extension SynchronisedCollectionViewsViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isScrolledRight = scrollView.contentOffset.x > lastContentOffset
        let currentCell = isScrolledRight
            ? iconDetailsCollectionView.visibleCells.first
            : iconDetailsCollectionView.visibleCells.last
        
        guard let cell = currentCell,
              let indexPath = iconDetailsCollectionView.indexPath(for: cell),
              scrollView == iconDetailsCollectionView else { return }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear) { [weak self] in
            guard let self = self else { return }
            
            let xPosition = CGFloat(indexPath.row) * self.line.frame.size.width
            self.line.frame.origin.x = xPosition
            self.iconsCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            self.iconDetailsCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastContentOffset = scrollView.contentOffset.x
    }
    
}

// MARK: - UICollectionViewDataSource
extension SynchronisedCollectionViewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCellsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellConfigurator = viewModel.viewConfigurator(at: indexPath.row,
                                                                in: indexPath.section,
                                                                for: collectionView.restorationIdentifier ?? "") else {
            return UICollectionViewCell()
        }
        
        return collectionView.configureCell(for: cellConfigurator, at: indexPath)
    }
    
}

// МАРК: - Instantiate
extension SynchronisedCollectionViewsViewController {
    
    static func create(viewModel: SynchronisedCollectionViewsViewModelProtocol,
                       with configurator: SynchronisedCollectionViewsLayoutConfigurator) -> UIViewController {
        let viewController = SynchronisedCollectionViewsViewController()
        viewController.viewModel = viewModel
        viewController.configurator = configurator
        
        return viewController
    }
    
}
