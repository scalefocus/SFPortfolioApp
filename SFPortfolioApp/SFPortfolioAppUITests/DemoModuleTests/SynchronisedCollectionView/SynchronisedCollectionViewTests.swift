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
    var iconsCell: XCUIElement!
    var detailsCell: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        setupElementsUnderTesting()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }
    
    func testDidTapSynchronisedCollectionViewCellShowsDemoScene() throws {
        // Given
        let navigationBar = app.navigationBars[Constants.CategoryItemTitle.synchronisedCollectionView]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        
        // Then
        XCTAssert(navigationBar.exists)
    }
    
    func testAssymetricCollectionViewDemoSceneAppearance() {
        // Given
        let backButton = navigationBar.buttons[Constants.CategoryTitle.collectionViews]
        let iconsCollectionView = app.collectionViews[Constants.Identifier.iconsCollectionView]
        let detailsCollectionView = app.collectionViews[Constants.Identifier.detailsCollectionView]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        
        // Then
        XCTAssert(backButton.exists)
        XCTAssert(iconsCollectionView.exists)
        XCTAssert(detailsCollectionView.exists)
    }
    
    func testIconsCollectionViewAppearance() {
        // Given
        let label = iconsCell.staticTexts[Constants.Identifier.iconsCellLabel]
        let image = iconsCell.images[Constants.Identifier.iconsCellImage]
        let selector = app.otherElements[Constants.Identifier.lineSelector]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        
        // Then
        XCTAssert(iconsCell.exists)
        XCTAssert(label.exists)
        XCTAssert(image.exists)
        XCTAssert(selector.exists)
        
    }
    
    func testDetailsCollectionViewAppearance() {
        // Given
        let label = detailsCell.staticTexts[Constants.Identifier.detailsCellLabel]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        
        // Then
        XCTAssert(detailsCell.exists)
        XCTAssert(label.exists)
    }
    
    func testDidTapBackButtonFinishesScene() {
        // Given
        let backButton = navigationBar.buttons[Constants.CategoryTitle.collectionViews]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        backButton.tap()
        
        // Then
        XCTAssertFalse(navigationBar.exists)
    }
    
    func testIconsCellsSelection() {
        // Given
        let fishIconsCellLabel = iconsCell.staticTexts[SyncronisedCollectionViewMockIcons.fish.text]
        let fishDetailsCellLabel = detailsCell.staticTexts[SyncronisedCollectionViewMockIcons.fish.text]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        fishIconsCellLabel.tap()
        
        // Then
        XCTAssert(fishIconsCellLabel.exists)
        XCTAssert(fishDetailsCellLabel.exists)
    }
    
    func testIconsCellsSwipeAndSelection() {
        // Given
        let fishIconsCellLabel = iconsCell.staticTexts[SyncronisedCollectionViewMockIcons.fish.text]
        let pizzaIconsCellLabel = iconsCell.staticTexts[SyncronisedCollectionViewMockIcons.pizza.text]
        let pizzaDetailsCellLabel = detailsCell.staticTexts[SyncronisedCollectionViewMockIcons.pizza.text]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        fishIconsCellLabel.swipeLeft()
        pizzaIconsCellLabel.tap()
        
        // Then
        XCTAssert(pizzaIconsCellLabel.exists)
        XCTAssert(pizzaDetailsCellLabel.exists)
    }
    
    func testDetailsCellSwipe() {
        // Given
        let desertsDetailsLabel = detailsCell.staticTexts[SyncronisedCollectionViewMockIcons.deserts.text]
        
        // When
        navigateToSynchronisedCollectionDemoScene()
        detailsCell.swipeLeft()
        
        //Then
        XCTAssert(desertsDetailsLabel.exists)
    }
    
    // MARK: - Private Functions
    private func setupElementsUnderTesting() {
        app = XCUIApplication()
        navigationBar = app.navigationBars[Constants.CategoryItemTitle.synchronisedCollectionView]
        let iconsCollectionView = app.collectionViews[Constants.Identifier.iconsCollectionView]
        let detailsCollectionView = app.collectionViews[Constants.Identifier.detailsCollectionView]
        iconsCell = iconsCollectionView
            .cells
            .matching(identifier: Constants.Identifier.iconsCell)
            .element
        detailsCell = detailsCollectionView
            .cells
            .matching(identifier: Constants.Identifier.detailsCell)
            .element
    }
    
    private func navigateToSynchronisedCollectionDemoScene() {
        let listTableView = app.tables[Constants.Identifier.listTableView]
        let collectionViewsButton = listTableView.staticTexts[Constants.CategoryTitle.collectionViews]
        let synchronisedCollection = listTableView.staticTexts[Constants.CategoryItemTitle.synchronisedCollectionView]
        
        collectionViewsButton.tap()
        synchronisedCollection.tap()
    }
    
}
