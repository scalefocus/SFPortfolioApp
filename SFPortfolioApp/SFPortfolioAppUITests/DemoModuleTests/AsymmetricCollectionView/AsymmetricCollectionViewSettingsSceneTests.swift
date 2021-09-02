//
//  AsymmetricCollectionViewSettingsSceneTests.swift
//  SFPortfolioAppUITests
//
//  Created by Stoyko Kolev on 24.08.21.
//

import XCTest

class AsymmetricCollectionViewSettingsSceneTests: XCTestCase {
    
    var app: XCUIApplication!
    var demoSceneNavigationBar: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        setupElementsUnderTesting()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }
    
    func testDidTapAsymmetricDemoSettingsShowsSettingsScene() {
        // Given
        let settingsView = app.otherElements[Constants.Identifier.asymmetricSettingsView]
        
        // When
        navigateToAsymmetricCollectionViewSettingsScene()
        
        // Then
        XCTAssert(settingsView.exists)
        XCTAssertFalse(demoSceneNavigationBar.isHittable)
    }
    
    func testAssymetricCollectionViewSettingsSceneAppearance() {
        // Given
        let containerView = app.otherElements[Constants.Identifier.asymmetricSettingsContainerView]
        let numberOfCellsLabel = app.staticTexts[Constants.Identifier.asymmetricSettingsNumberOfCellsLabel]
        let cellPaddingLabel = app.staticTexts[Constants.Identifier.asymmetricSettingsCellPaddingLabel]
        let sizeRatioLabel = app.staticTexts[Constants.Identifier.asymmetricSettingsSizeRatioLabel]
        let offsetLabel = app.staticTexts[Constants.Identifier.asymmetricSettingsOffsetLabel]
        let numberOfCellsSlider = app.sliders[Constants.Identifier.asymmetricSettingsNumberOfCellsSlider]
        let cellPaddingSlider = app.sliders[Constants.Identifier.asymmetricSettingsCellPaddingSlider]
        let sizeRatioSlider = app.sliders[Constants.Identifier.asymmetricSettingsSizeRatioSlider]
        let offsetSlider = app.sliders[Constants.Identifier.asymmetricSettingsOffsetSlider]
        
        // When
        navigateToAsymmetricCollectionViewSettingsScene()
        
        // Then
        XCTAssert(containerView.exists)
        XCTAssert(numberOfCellsLabel.exists)
        XCTAssert(cellPaddingLabel.exists)
        XCTAssert(sizeRatioLabel.exists)
        XCTAssert(offsetLabel.exists)
        XCTAssert(numberOfCellsSlider.exists)
        XCTAssert(cellPaddingSlider.exists)
        XCTAssert(sizeRatioSlider.exists)
        XCTAssert(offsetSlider.exists)
    }
    
    func testDidSwipeDownContainerViewFinishesScene() {
        // Given
        let containerView = app.otherElements[Constants.Identifier.asymmetricSettingsContainerView]
        
        // When
        navigateToAsymmetricCollectionViewSettingsScene()
        containerView.swipeDown()
        
        // Then
        XCTAssert(demoSceneNavigationBar.isHittable)
    }
    
    func testDidSwipeDownSettingsViewFinishesScene() {
        // Given
        let settingsView = app.otherElements[Constants.Identifier.asymmetricSettingsView]
        
        // When
        navigateToAsymmetricCollectionViewSettingsScene()
        settingsView.swipeDown()
        
        // Then
        XCTAssert(demoSceneNavigationBar.isHittable)
    }
    
    // MARK: - Private Functions
    private func setupElementsUnderTesting() {
        app = XCUIApplication()
        demoSceneNavigationBar = app.navigationBars[Constants.CategoryItemTitle.asymmetricCollectionView]
    }
    
    private func navigateToAsymmetricCollectionViewSettingsScene() {
        let listTableView = app.tables[Constants.Identifier.listTableView]
        let collectionViewsButton = listTableView.staticTexts[Constants.CategoryTitle.collectionViews]
        let settingsButton = demoSceneNavigationBar.buttons[Constants.Identifier.settingsButton]
        let asymmetricCollectionButton = listTableView.staticTexts[Constants.CategoryItemTitle.asymmetricCollectionView]
        
        collectionViewsButton.tap()
        asymmetricCollectionButton.tap()
        settingsButton.tap()
    }
    
}
