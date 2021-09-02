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
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }
    
    func testCategorySceneShowsOnLaunch() {
        // Given
        let navigationBar = app.navigationBars[Constants.CategoryList.title]
        let scaleFocusLogo = app.images[Constants.Identifier.logo]
        let categoriesTableView = app.tables[Constants.Identifier.listTableView]
        let categoryCell = app.cells.element(boundBy: 0)
        
        // When
        app.launch()
        
        // Then
        XCTAssert(scaleFocusLogo.exists)
        XCTAssert(navigationBar.exists)
        XCTAssert(categoriesTableView.exists)
        XCTAssert(categoryCell.exists)
    }
    
    func testCategoriesTableViewBackground() {
        // Given
        let categoriesTableView = app.images[Constants.Identifier.listTableViewBackground]
        
        // When
        app.launch()
        
        // Then
        XCTAssert(categoriesTableView.exists)
    }
    
    func testCategoryTableViewCellAppearance() {
        // Given
        let buttonsCell = app
            .tables[Constants.Identifier.listTableView]
            .staticTexts[Constants.CategoryTitle.buttons]
        
        // When
        app.launch()
        
        // Then
        XCTAssertFalse(app.otherElements[Constants.Identifier.tagsStackView].isHittable)
        XCTAssertEqual(buttonsCell.label, Constants.CategoryTitle.buttons)
    }
    
    func testDidTapTableViewCellFinishesScene() {
        // Given
        let buttonsCategoryNavigationBar = app.navigationBars[Constants.CategoryTitle.buttons]
        let buttonsCell = app
            .tables[Constants.Identifier.listTableView]
            .staticTexts[Constants.CategoryTitle.buttons]
        
        // When
        app.launch()
        buttonsCell.tap()
        
        // Then
        XCTAssert(buttonsCategoryNavigationBar.exists)
    }
    
}
