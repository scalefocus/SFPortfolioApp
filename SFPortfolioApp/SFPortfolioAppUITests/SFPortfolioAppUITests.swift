//
//  SFPortfolioAppUITests.swift
//  SFPortfolioAppUITests
//
//  Created by Stoyko Kolev on 16.08.21.
//

import XCTest

class SFPortfolioAppUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    /// Measures how long it takes to launch your application.
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
