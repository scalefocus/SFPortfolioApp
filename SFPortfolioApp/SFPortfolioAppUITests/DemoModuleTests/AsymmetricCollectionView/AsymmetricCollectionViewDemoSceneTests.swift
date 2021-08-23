//
//  AsymmetricCollectionViewDemoSceneTests.swift
//  SFPortfolioAppUITests
//
//  Created by Stoyko Kolev on 23.08.21.
//

import XCTest

class AsymmetricCollectionViewDemoSceneTests: XCTestCase {
    
    var app: XCUIApplication!
    var navigationBar: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        setupElementsUnderTesting()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }
    
    func testDidTapAsymmetricCollectionViewCellShowsDemoScene() {
        // Given
        let navigationBar = app.navigationBars[Constants.CategoryItemTitle.asymmetricCollectionView]
        
        // When
        navigateToAsymmetricCollectionViewDemoScene()
        
        // Then
        XCTAssert(navigationBar.exists)
    }
    
    func testAssymetricCollectionViewDemoSceneAppearance() {
        // Given
        let settingsButton = navigationBar.buttons[Constants.Identifier.settingsButton]
        let backButton = navigationBar.buttons[Constants.CategoryTitle.collectionViews]
        let collectionView = app.collectionViews[Constants.Identifier.asymmetricDemoCollectionView]
        let playerImageView = app.images[Constants.Identifier.asymmetricDemoPlayer]
        let backgroundImageView = app.images[Constants.Identifier.asymmetricDemoBackground]
        
        // When
        navigateToAsymmetricCollectionViewDemoScene()
        
        // Then
        XCTAssert(settingsButton.exists)
        XCTAssert(backButton.exists)
        XCTAssert(collectionView.exists)
        XCTAssert(playerImageView.exists)
        XCTAssert(backgroundImageView.exists)
    }
    
    func testAssymetricCollectionViewCellAppearance() {
        // Given
        let collectionView = app.collectionViews[Constants.Identifier.asymmetricDemoCollectionView]
        let collectionViewCell = collectionView
            .children(matching: .cell)
            .matching(identifier: Constants.Identifier.asymmetricDemoCollectionViewCell)
            .element
        let enemyImageView = collectionViewCell.images[Constants.Identifier.asymmetricDemoEnemy]
       
        // When
        navigateToAsymmetricCollectionViewDemoScene()
        
        // Then
        XCTAssert(collectionViewCell.exists)
        XCTAssert(enemyImageView.exists)
    }

    func testDidTapSettingsButtonFinishesScene() {
        // Given
        let settingsButton = navigationBar.buttons[Constants.Identifier.settingsButton]
        
        // When
        navigateToAsymmetricCollectionViewDemoScene()
        settingsButton.tap()

        // Then
        XCTAssertFalse(navigationBar.isHittable)
    }
    
    func testDidTapBackButtonFinishesScene() {
        // Given
        let backButton = navigationBar.buttons[Constants.CategoryTitle.collectionViews]
        
        // When
        navigateToAsymmetricCollectionViewDemoScene()
        backButton.tap()

        // Then
        XCTAssertFalse(navigationBar.exists)
    }
    
    // MARK: - Private Functions
    private func setupElementsUnderTesting() {
        app = XCUIApplication()
        navigationBar = app.navigationBars[Constants.CategoryItemTitle.asymmetricCollectionView]
    }
    
    private func navigateToAsymmetricCollectionViewDemoScene() {
        let listTableView = app.tables[Constants.Identifier.listTableView]
        let collectionViewsButton = listTableView.staticTexts[Constants.CategoryTitle.collectionViews]
        let asymmetricCollectionButton = listTableView.staticTexts[Constants.CategoryItemTitle.asymmetricCollectionView]
        
        collectionViewsButton.tap()
        asymmetricCollectionButton.tap()
    }
    
}
