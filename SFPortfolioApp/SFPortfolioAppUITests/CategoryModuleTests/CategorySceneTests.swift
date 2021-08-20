//
//  CategorySceneTests.swift
//  SFPortfolioAppUITests
//
//  Created by Stoyko Kolev on 20.08.21.
//

import XCTest

class CategorySceneTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testCategorySceneShowsOnLaunch() {
        // Given
        let navigationBar = app.navigationBars[Accessibility.Label.categoriesNavigationBar]
        let scaleFocusLogo = app.images[Accessibility.Identifier.logo]
        let categoriesTableView = app.tables[Accessibility.Identifier.listTableView]
        let categoryCell = app.cells.element(boundBy: 0)
        
        // Then
        XCTAssert(scaleFocusLogo.exists)
        XCTAssert(navigationBar.exists)
        XCTAssert(categoriesTableView.exists)
        XCTAssert(categoryCell.exists)
    }
    
    func testCategoriesTableViewBackground() {
        // Given
        let categoriesTableView = app.images[Accessibility.Identifier.listTableViewBackground]
        
        // Then
        XCTAssert(categoriesTableView.exists)
    }
    
    func testCategoryTableViewCellAppearance() {
        // Given
        let buttonsCell = app
            .tables[Accessibility.Identifier.listTableView]
            .staticTexts[Accessibility.Label.buttonsCell]
        
        // Then
        XCTAssertFalse(app.otherElements[Accessibility.Identifier.tagsStackView].isHittable)
        XCTAssertEqual(buttonsCell.label, Accessibility.Label.buttonsCell)
    }
    
    func testDidTapTableViewCellFinishesScene() {
        // Given
        let buttonsCategoryNavigationBar = app.navigationBars[Accessibility.Label.buttonsCell]
        let buttonsCell = app
            .tables[Accessibility.Identifier.listTableView]
            .staticTexts[Accessibility.Label.buttonsCell]
        
        // When
        buttonsCell.tap()
        
        // Then
        XCTAssert(buttonsCategoryNavigationBar.exists)
    }
    
}
