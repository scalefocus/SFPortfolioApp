//
//  SynchronisedCollectionViewTests.swift
//  SFPortfolioAppUITests
//
//  Created by Stoyko Kolev on 26.08.21.
//

import XCTest

class SynchronisedCollectionViewTests: XCTestCase {
    
    var app: XCUIApplication!
    var navigationBar: XCUIElement!
    var backButton: XCUIElement!
    var iconsCollectionView: XCUIElement!
    var detailsCollectionView: XCUIElement!
    var iconsCell: XCUIElement!
    var detailsCell: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        setupElementsUnderTesting()
        navigateToSynchronisedCollectionDemoScene()
    }
    
    func testDidTapSynchronisedCollectionViewCellShowsDemoScene() throws {
        // Then
        XCTAssert(navigationBar.exists)
    }
    
    func testAssymetricCollectionViewDemoSceneAppearance() {
        // Then
        XCTAssert(backButton.exists)
        XCTAssert(iconsCollectionView.exists)
        XCTAssert(detailsCollectionView.exists)
    }
    
    func testIconsCollectionViewAppearance() {
        // Given
        let label = iconsCell.staticTexts[Accessibility.Identifier.iconsCellLabel]
        let image = iconsCell.images[Accessibility.Identifier.iconsCellImage]
        let selector = app.otherElements[Accessibility.Identifier.lineSelector]
        
        // Then
        XCTAssert(iconsCell.exists)
        XCTAssert(label.exists)
        XCTAssert(image.exists)
        XCTAssert(selector.exists)
        
    }
    
    func testDetailsCollectionViewAppearance() {
        // Given
        let label = detailsCell.staticTexts[Accessibility.Identifier.detailsCellLabel]
        
        // Then
        XCTAssert(detailsCell.exists)
        XCTAssert(label.exists)
    }
    
    func testDidTapBackButtonFinishesScene() {
        // When
        backButton.tap()
        
        // Then
        XCTAssertFalse(navigationBar.exists)
    }
    
    func testIconsCellsSelection() {
        // Given
        let fishIconsCellLabel = iconsCell.staticTexts[Accessibility.Label.fish]
        let fishDetailsCellLabel = detailsCell.staticTexts[Accessibility.Label.fish]
        
        // When
        fishIconsCellLabel.tap()
        
        // Then
        XCTAssert(fishIconsCellLabel.exists)
        XCTAssert(fishDetailsCellLabel.exists)
    }
    
    func testIconsCellsSwipeAndSelection() {
        // Given
        let fishIconsCellLabel = iconsCollectionView.staticTexts[Accessibility.Label.fish]
        let pizzaIconsCellLabel = iconsCell.staticTexts[Accessibility.Label.pizza]
        let pizzaDetailsCellLabel = detailsCell.staticTexts[Accessibility.Label.pizza]
        
        // When
        fishIconsCellLabel.swipeLeft()
        pizzaIconsCellLabel.tap()
        
        // Then
        XCTAssert(pizzaIconsCellLabel.exists)
        XCTAssert(pizzaDetailsCellLabel.exists)
    }
    
    func testDetailsCellSwipe() {
        // Given
        let desertsDetailsLabel = detailsCell.staticTexts[Accessibility.Label.desserts]
        
        // When
        detailsCell.swipeLeft()
        
        //Then
        XCTAssert(desertsDetailsLabel.exists)
    }
    
    // MARK: - Private Functions
    private func setupElementsUnderTesting() {
        app = XCUIApplication()
        navigationBar = app.navigationBars[Accessibility.Label.synchronisedCollectionView]
        backButton = navigationBar.buttons[Accessibility.Label.collectionViews]
        iconsCollectionView = app.collectionViews[Accessibility.Identifier.iconsCollectionView]
        detailsCollectionView = app.collectionViews[Accessibility.Identifier.detailsCollectionView]
        iconsCell = iconsCollectionView
            .cells
            .matching(identifier: Accessibility.Identifier.iconsCell)
            .element
        detailsCell = detailsCollectionView
            .cells
            .matching(identifier: Accessibility.Identifier.detailsCell)
            .element
    }
    
    private func navigateToSynchronisedCollectionDemoScene() {
        let listTableView = app.tables[Accessibility.Identifier.listTableView]
        let collectionViewsButton = listTableView.staticTexts[Accessibility.Label.collectionViews]
        let synchronisedCollectionView = listTableView.staticTexts[Accessibility.Label.synchronisedCollectionView]
        
        app.launch()
        collectionViewsButton.tap()
        synchronisedCollectionView.tap()
    }
    
}
