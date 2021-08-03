//
//  AsymmetricCollectionViewLayout.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 7.07.21.
//

import UIKit

class AsymmetricCollectionViewLayout: UICollectionViewLayout {
    
    // MARK: - Public Properties
    override var collectionViewContentSize: CGSize {
        return CGSize(width: availableWidth, height: contentHeight)
    }
    
    // MARK: - Private Properties
    private let cellPaddingRatio: CGFloat
    private let maxCellPaddingRatio: CGFloat = 0.25
    private let verticalOffsetRatio: CGFloat
    private let cellHeightRatio: CGFloat
    private let numberOfColumnsInPortrait: Int
    private var attributes: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var numberOfColumnsInLandscape: Int {
        Int(availableWidth / (availableHeight / CGFloat(numberOfColumnsInPortrait)))
    }
    private var sideInsets: CGFloat {
        guard let inset = collectionView?.contentInset else { return 0 }
        return inset.left + inset.right
    }
    private var availableWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width - sideInsets
    }
    private var availableHeight: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.height - sideInsets
    }
    
    // MARK: - Initializers
    init(configurator: AsymmetricCollectionViewLayoutConfigurator) {
        numberOfColumnsInPortrait = configurator.numberOfColumnsInPortrait ?? 3
        verticalOffsetRatio = configurator.verticalOffsetRatio ?? 0.5
        cellHeightRatio = configurator.cellHeightRatio ?? 1
        cellPaddingRatio = min(configurator.cellPaddingRatio ?? 0.1, maxCellPaddingRatio)
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
              let collectionView = collectionView else { return }
        let columns = availableHeight > availableWidth ? numberOfColumnsInPortrait : numberOfColumnsInLandscape
        prepareLayout(collectionView, columns: columns)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributes[indexPath.item]
    }
    
    // MARK: - Private Functions
    private func prepareLayout(_ collectionView: UICollectionView, columns: Int) {
        let columnWidth = availableWidth / CGFloat(columns)
        let cellPadding = columnWidth * cellPaddingRatio
        let columnHeight = columnWidth * cellHeightRatio
        var xOffset: [CGFloat] = []
        for column in 0..<columns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = []
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            for column in 0..<columns {
                let isEven = column % 2 == 0
                let oddNumberOffset = columnHeight * verticalOffsetRatio
                yOffset.append(isEven ? 0 : oddNumberOffset)
            }
            guard let xPosition = xOffset[safeAt: column],
                  let yPosition = yOffset[safeAt: column] else { continue }
            let frame = CGRect(x: xPosition, y: yPosition, width: columnWidth, height: columnHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let cellAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            cellAttributes.frame = insetFrame
            attributes.append(cellAttributes)
            contentHeight = max(collectionView.frame.height + cellPadding, frame.maxY)
            yOffset[column] = yOffset[column] + columnHeight
            column = column < (columns - 1) ? (column + 1) : 0
        }
    }
    
}
