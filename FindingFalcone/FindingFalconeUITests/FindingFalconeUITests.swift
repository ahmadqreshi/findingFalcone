//
//  FindingFalconeUITests.swift
//  FindingFalconeUITests
//
//  Created by Admin on 27/08/23.
//

import XCTest

final class FindingFalconeUITests: XCTestCase {

    
    private var app: XCUIApplication!
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    override func tearDown() {
        app = nil
    }
    
    
    func testMainViewAppearance() {
        let navigationBarText = app.staticTexts["Finding Falcone!"]
        XCTAssertTrue(navigationBarText.exists)
        XCTAssertEqual("Finding Falcone!", "Finding Falcone!")
    }
    
    func testResetButton() {
        let resetButton = app.buttons["Reset"]
        XCTAssertTrue(resetButton.exists)
    }
    
    func testDestinationButton() {
        let destinationButton1 = app.staticTexts["Destination 1"]
        let destinationButton2 = app.staticTexts["Destination 2"]
        let destinationButton3 = app.staticTexts["Destination 3"]
        let destinationButton4 = app.staticTexts["Destination 4"]
        XCTAssertTrue(destinationButton1.exists && destinationButton2.exists && destinationButton3.exists && destinationButton4.exists)
    }
    
    func testFindingFalconeButton() {
        let findButton = app.buttons["Finding Falcone"]
        XCTAssertTrue(findButton.exists)
    }
}
