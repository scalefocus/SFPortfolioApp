//
//  SynchronisedCollectionViewsLayout.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 13.07.21.
//

import UIKit

class SynchronisedCollectionViewsLayout: UICollectionViewLayout {
    
    // MARK: Public Properties
    let numberOfItemsInPortrait: CGFloat
    
    // MARK: Private Properties
    private let defaultYOffset: CGFloat = .zero
    private var attributes: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    
    private var numberOfItems: Int {
        guard let collectionView = collectionView else { return 0 }
        
        return collectionView.numberOfItems(inSection: 0)
    }
    
    private var contentWidth: CGFloat {
        calculateCellWidth() * CGFloat(numberOfItems)
    }
    
    override var collectionViewContentSize: CGSize {
        CGSize(width: contentWidth, height: contentHeight)
    }
    
    // MARK: - Init
    init(configurator: SynchronisedCollectionViewsLayoutConfigurator) {
        numberOfItemsInPortrait = configurator.numberOfItemsInPortrait
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    override func invalidateLayout() {
        super.invalidateLayout()
        attributes.removeAll()
    }
    
    override func prepare() {
        guard attributes.isEmpty,
              let collectionView = collectionView,
              let identifier = collectionView.restorationIdentifier,
              let collectionViewType = SynchronisedCollectionViews(rawValue: identifier) else { return }
        
        switch collectionViewType {
        case .barCollectionView:
            contentHeight = collectionView.frame.size.height
        case .detailsCollectionView:
            contentHeight = collectionView.bounds.size.height
        }
        
        let cellWidth = contentWidth / CGFloat(numberOfItems)
        
        for item in 0..<numberOfItems {
            let xOffset = CGFloat(item) * cellWidth
            let indexPath = IndexPath(item: item, section: 0)
            let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            layoutAttributes.frame = CGRect(x: xOffset,
                                            y: defaultYOffset,
                                            width: cellWidth,
                                            height: contentHeight)
            
            attributes.append(layoutAttributes)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        attributes.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        attributes[indexPath.item]
    }
    
    // MARK: - Private Functions
    private func calculateCellWidth() -> CGFloat {
        guard let collectionView = collectionView,
              let superView = collectionView.superview,
              let identifier = collectionView.restorationIdentifier,
              let collectionViewType = SynchronisedCollectionViews(rawValue: identifier) else { return .zero }
        
        switch collectionViewType {
        case .barCollectionView:
            let screenWidth = UIDevice.current.orientation.isLandscape
                ? superView.frame.height
                : superView.frame.width
            return screenWidth / numberOfItemsInPortrait
        case .detailsCollectionView:
            return collectionView.bounds.size.width
        }
    }
    
}
