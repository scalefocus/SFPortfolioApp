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
        navigateToCategoryItemsScene()
    }
    
    func testCategoryItemsSceneShowsOnLaunch() {
        // Given
        let buttonsNavigationBar = app.navigationBars[Accessibility.Label.buttonsCell]
        let backButton = buttonsNavigationBar.buttons[Accessibility.Label.categoriesNavigationBar]
        let scaleFocusLogo = app.images[Accessibility.Identifier.logo]
        let categoryItemsTableView = app.tables[Accessibility.Identifier.listTableView]
        let categoryCell = app.cells.element(boundBy: 0)
        
        // Then
        XCTAssert(buttonsNavigationBar.exists)
        XCTAssert(backButton.exists)
        XCTAssert(scaleFocusLogo.exists)
        XCTAssert(categoryItemsTableView.exists)
        XCTAssert(categoryCell.exists)
    }
    
    func testCategoryItemsTableViewBackground() {
        // Given
        let categoryItemsBackground = app.images[Accessibility.Identifier.listTableViewBackground]
        
        // Then
        XCTAssert(categoryItemsBackground.exists)
    }
    
    func testCategoryItemsTableViewCellAppearance() {
        // Given
        let executionButtonsCell = app
            .tables[Accessibility.Identifier.listTableView]
            .staticTexts[Accessibility.Label.executionButtonCell]
        
        // Then
        XCTAssert(app.otherElements[Accessibility.Identifier.tagsStackView].isHittable)
        XCTAssert(executionButtonsCell.exists)
    }
    
    func testDidTapTableViewCellFinishesScene() {
        // Given
        let executionButtonNavigationBar = app.navigationBars[Accessibility.Label.executionButtonCell]
        let executionButtonCell = app
            .tables[Accessibility.Identifier.listTableView]
            .staticTexts[Accessibility.Label.executionButtonCell]
                        
        // When
        executionButtonCell.tap()
        
        // Then
        XCTAssert(executionButtonNavigationBar.exists)
    }
    
    func testDidTapBackButtonFinishesScene() {
        // Given
        let categoriesNavigationBar = app.navigationBars[Accessibility.Label.categoriesNavigationBar]
        let buttonsNavigationBar = app.navigationBars[Accessibility.Label.buttonsCell]
        let backButton = buttonsNavigationBar.buttons[Accessibility.Label.categoriesNavigationBar]
     
        // When
        backButton.tap()
        
        // Then
        XCTAssert(categoriesNavigationBar.exists)
    }
    
    // MARK: - Private Functions
    private func navigateToCategoryItemsScene() {
        let buttonsCell = app
            .tables[Accessibility.Identifier.listTableView]
            .staticTexts[Accessibility.Label.buttonsCell]
        app.launch()
        buttonsCell.tap()
    }
    
}
