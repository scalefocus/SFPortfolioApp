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
    var backButton: XCUIElement!
    var settingsButton: XCUIElement!
    var collectionView: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        setupElementsUnderTesting()
        navigateToAsymmetricCollectionViewDemoScene()
    }
    
    func testDidTapAsymmetricCollectionViewCellShowsDemoScene() {
        // Then
        XCTAssert(navigationBar.exists)
    }
    
    func testAssymetricCollectionViewDemoSceneAppearance() {
        // Given
        let playerImageView = app.images[Accessibility.Identifier.assymetricDemoPlayer]
        let backgroundImageView = app.images[Accessibility.Identifier.assymetricDemoBackground]
        
        // Then
        XCTAssert(settingsButton.exists)
        XCTAssert(backButton.exists)
        XCTAssert(collectionView.exists)
        XCTAssert(playerImageView.exists)
        XCTAssert(backgroundImageView.exists)
    }
    
    func testAssymetricCollectionViewCellAppearance() {
        // Given
        let collectionViewCell = collectionView
            .children(matching: .cell)
            .matching(identifier: Accessibility.Identifier.assymetricDemoCollectionViewCell)
            .element
        let enemyImageView = collectionViewCell.images[Accessibility.Identifier.assymetricDemoEnemy]

        // Then
        XCTAssert(collectionViewCell.exists)
        XCTAssert(enemyImageView.exists)
    }

    func testDidTapSettingsButtonFinishesScene() {
        // When
        settingsButton.tap()

        // Then
        XCTAssertFalse(navigationBar.isHittable)
    }
    
    func testDidTapBackButtonFinishesScene() {
        // When
        backButton.tap()

        // Then
        XCTAssertFalse(navigationBar.exists)
    }
    
    // MARK: - Private Functions
    private func setupElementsUnderTesting() {
        app = XCUIApplication()
        navigationBar = app.navigationBars[Accessibility.Label.asymmetricCollectionView]
        settingsButton = navigationBar.buttons[Accessibility.Identifier.settingsButton]
        backButton = navigationBar.buttons[Accessibility.Label.collectionViewsCell]
        collectionView = app.collectionViews[Accessibility.Identifier.asymmetricDemoCollectionView]
    }
    
    private func navigateToAsymmetricCollectionViewDemoScene() {
        let listTableView = app.tables[Accessibility.Identifier.listTableView]
        let collectionViewsButton = listTableView.staticTexts[Accessibility.Label.collectionViewsCell]
        let asymmetricCollectionViewButton = listTableView.staticTexts[Accessibility.Label.asymmetricCollectionView]
        
        app.launch()
        collectionViewsButton.tap()
        asymmetricCollectionViewButton.tap()
    }
    
}
