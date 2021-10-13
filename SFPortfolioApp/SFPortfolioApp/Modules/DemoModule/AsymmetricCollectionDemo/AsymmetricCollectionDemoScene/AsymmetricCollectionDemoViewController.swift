//
//  AsymmetricCollectionDemoViewController.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.08.21.
//

import SFBaseKit

class AsymmetricCollectionDemoViewController: BaseViewController {
    
    // MARK: - Properties
    private var viewModel: AsymmetricCollectionDemoViewModelProtocol!
    
    // MARK: - IBOutlets
    @IBOutlet private weak var backgroundImageVIew: UIImageView!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet private weak var demoCollectionView: UICollectionView!
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        setupBindings()
        setupAccessibility()
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        guard parent == nil else { return }
        viewModel.finishScene()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        demoCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - Private Functions
    @objc private func settingsTapped() {
        viewModel.selectSettings()
    }
    
    private func setupCollectionView() {
        demoCollectionView.register(cellNames: viewModel.reuseIdentifiers)
        demoCollectionView.collectionViewLayout = AsymmetricCollectionViewLayout()
    }
    
    private func setupNavigationBar() {
        title = viewModel.title
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.settings,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(settingsTapped))
    }
    
    private func setupBindings() {
        viewModel.layoutConfigurator
            .sink { [weak self] configurator in
                let layout = AsymmetricCollectionViewLayout(configurator: configurator)
                self?.demoCollectionView.collectionViewLayout = layout
            }
    }
    
    private func setupAccessibility() {
        backgroundImageVIew.accessibilityIdentifier = Constants.Identifier.asymmetricDemoBackground
        playerImageView.accessibilityIdentifier = Constants.Identifier.asymmetricDemoPlayer
        demoCollectionView.accessibilityIdentifier = Constants.Identifier.asymmetricDemoCollectionView
    }
    
}

// MARK: - UICollectionViewDataSource
extension AsymmetricCollectionDemoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCellsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AsymmetricCollectionViewCell.typeName,
                                                      for: indexPath)
        cell.startWiggle()
        return cell
    }
    
}

// MARK: - Instantiate
extension AsymmetricCollectionDemoViewController {
    
    static func create(viewModel: AsymmetricCollectionDemoViewModel) -> UIViewController {
        let viewController = AsymmetricCollectionDemoViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}

