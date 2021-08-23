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
    var containerView: XCUIElement!
    var settingsView: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        setupElementsUnderTesting()
        navigateToAsymmetricCollectionViewSettingsScene()
    }
    
    func testDidTapAsymmetricDemoSettingsShowsSettingsScene() {
        // Then
        XCTAssert(settingsView.exists)
        XCTAssertFalse(demoSceneNavigationBar.isHittable)
    }
    
    func testAssymetricCollectionViewSettingsSceneAppearance() {
        // Given
        let numberOfCellsLabel = app.staticTexts[Accessibility.Identifier.asymmetricSettingsNumberOfCellsLabel]
        let cellPaddingLabel = app.staticTexts[Accessibility.Identifier.asymmetricSettingsCellPaddingLabel]
        let sizeRatioLabel = app.staticTexts[Accessibility.Identifier.asymmetricSettingsSizeRatioLabel]
        let offsetLabel = app.staticTexts[Accessibility.Identifier.asymmetricSettingsOffsetLabel]
        let numberOfCellsSlider = app.sliders[Accessibility.Identifier.asymmetricSettingsNumberOfCellsSlider]
        let cellPaddingSlider = app.sliders[Accessibility.Identifier.asymmetricSettingsCellPaddingSlider]
        let sizeRatioSlider = app.sliders[Accessibility.Identifier.asymmetricSettingsSizeRatioSlider]
        let offsetSlider = app.sliders[Accessibility.Identifier.asymmetricSettingsOffsetSlider]
        
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
        // When
        containerView.swipeDown()
        
        // Then
        XCTAssert(demoSceneNavigationBar.isHittable)
    }
    
    func testDidSwipeDownSettingsViewFinishesScene() {
        // When
        settingsView.swipeDown()
        
        // Then
        XCTAssert(demoSceneNavigationBar.isHittable)
    }
    
    // MARK: - Private Functions
    private func setupElementsUnderTesting() {
        app = XCUIApplication()
        demoSceneNavigationBar = app.navigationBars[Accessibility.Label.asymmetricCollectionView]
        containerView = app.otherElements[Accessibility.Identifier.asymmetricSettingsContainerView]
        settingsView = app.otherElements[Accessibility.Identifier.asymmetricSettingsView]
    }
    
    private func navigateToAsymmetricCollectionViewSettingsScene() {
        let listTableView = app.tables[Accessibility.Identifier.listTableView]
        let collectionViewsButton = listTableView.staticTexts[Accessibility.Label.collectionViewsCell]
        let asymmetricCollectionViewButton = listTableView.staticTexts[Accessibility.Label.asymmetricCollectionView]
        let settingsButton = demoSceneNavigationBar.buttons[Accessibility.Identifier.settingsButton]
        
        app.launch()
        collectionViewsButton.tap()
        asymmetricCollectionViewButton.tap()
        settingsButton.tap()
    }
    
}
