//
//  AsymmetricCollectionDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 4.08.21.
//

import Foundation

class AsymmetricCollectionDemoViewModel: AsymmetricCollectionDemoViewModelProtocol {
    
    // MARK: - Properties
    let layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator>
    weak var delegate: AsymmetricCollectionDemoViewModelCoordinatorDelegate?
    var title: String {
        CategoryItem.asymmetricCollectionView.title
    }
    var reuseIdentifiers: [String] {
        [AsymmetricCollectionViewCell.typeName]
    }
    private let demoItems = 30
    
    // MARK: - Init
    init(layoutConfigurator: Observable<AsymmetricCollectionViewLayoutConfigurator>) {
        self.layoutConfigurator = layoutConfigurator
    }
    
    // MARK: - Public Functions
    func numberOfCellsInSection(_ section: Int) -> Int? {
        demoItems
    }
    
    func selectSettings() {
        delegate?.didFinishDemoSceneWithSettingsSelected()
    }
    
    func finishScene() {
        delegate?.didFinishAsymmetricCollectionDemoScene()
    }
    
}
