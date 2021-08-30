//
//  CategoryItemsSceneTests.swift
//  SFPortfolioAppUITests
//
//  Created by Stoyko Kolev on 23.08.21.
//

import XCTest

class CategoryItemsSceneTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }
    
    func testCategoryItemsSceneShowsOnLaunch() {
        // Given
        let buttonsNavigationBar = app.navigationBars[Constants.CategoryTitle.buttons]
        let backButton = buttonsNavigationBar.buttons[Constants.CategoryList.title]
        let scaleFocusLogo = app.images[Constants.AccessibilityIdentifier.logo]
        let categoryItemsTableView = app.tables[Constants.AccessibilityIdentifier.listTableView]
        let categoryCell = app.cells.element(boundBy: 0)
        
        // When
        navigateToCategoryItemsScene()
        
        // Then
        XCTAssert(buttonsNavigationBar.exists)
        XCTAssert(backButton.exists)
        XCTAssert(scaleFocusLogo.exists)
        XCTAssert(categoryItemsTableView.exists)
        XCTAssert(categoryCell.exists)
    }
    
    func testCategoryItemsTableViewBackground() {
        // Given
        let categoryItemsBackground = app.images[Constants.AccessibilityIdentifier.listTableViewBackground]
        
        // When
        navigateToCategoryItemsScene()
        
        // Then
        XCTAssert(categoryItemsBackground.exists)
    }
    
    func testCategoryItemsTableViewCellAppearance() {
        // Given
        let executionButtonsCell = app
            .tables[Constants.AccessibilityIdentifier.listTableView]
            .staticTexts[Constants.CategoryItemTitle.executionButton]
        
        // When
        navigateToCategoryItemsScene()
        
        // Then
        XCTAssert(app.otherElements[Constants.AccessibilityIdentifier.tagsStackView].isHittable)
        XCTAssert(executionButtonsCell.exists)
    }
    
    func testDidTapTableViewCellFinishesScene() {
        // Given
        let executionButtonNavigationBar = app.navigationBars[Constants.CategoryItemTitle.executionButton]
        let executionButtonCell = app
            .tables[Constants.AccessibilityIdentifier.listTableView]
            .staticTexts[Constants.CategoryItemTitle.executionButton]
        
        // When
        navigateToCategoryItemsScene()
        executionButtonCell.tap()
        
        // Then
        XCTAssert(executionButtonNavigationBar.exists)
    }
    
    func testDidTapBackButtonFinishesScene() {
        // Given
        let categoriesNavigationBar = app.navigationBars[Constants.CategoryList.title]
        let buttonsNavigationBar = app.navigationBars[Constants.CategoryTitle.buttons]
        let backButton = buttonsNavigationBar.buttons[Constants.CategoryList.title]
        
        // When
        navigateToCategoryItemsScene()
        backButton.tap()
        
        // Then
        XCTAssert(categoriesNavigationBar.exists)
    }
    
    // MARK: - Private Functions
    private func navigateToCategoryItemsScene() {
        let buttonsCell = app
            .tables[Constants.AccessibilityIdentifier.listTableView]
            .staticTexts[Constants.CategoryTitle.buttons]
        buttonsCell.tap()
    }
    
}
