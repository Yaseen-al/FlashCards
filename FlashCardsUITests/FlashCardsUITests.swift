//
//  FlashCardsUITests.swift
//  FlashCardsUITests
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import XCTest

class FlashCardsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSignIn(){
        
        let app = XCUIApplication()
        app.tabBars.buttons["Account"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let enterYourEmailTextField = app.textFields["Enter your Email"]
        enterYourEmailTextField.tap()
        enterYourEmailTextField.typeText("wegoman@hotmail.co")
        
        let enterYourPasswordSecureTextField = app.secureTextFields["Enter your Password"]
        enterYourPasswordSecureTextField.tap()
        enterYourEmailTextField.tap()
        enterYourEmailTextField.tap()
        enterYourEmailTextField.typeText("m")
        enterYourPasswordSecureTextField.tap()
        enterYourPasswordSecureTextField.tap()
        enterYourPasswordSecureTextField.typeText("wegowego")
        app.buttons["   Login   "].tap()
    }
    func testAddingCategory(){
        
        let app = XCUIApplication()
        app.navigationBars["Flash Cards"].buttons["New Category"].tap()
        
        let exScienceAdventureSpaceUnderTheSunTextField = app.textFields["ex, Science, Adventure, Space, under the sun"]
        exScienceAdventureSpaceUnderTheSunTextField.tap()
        exScienceAdventureSpaceUnderTheSunTextField.typeText("Aventure and beyond with swift")
        app.navigationBars["New Category"].buttons["Create"].tap()
    }
    
    func testAddingCard(){
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Music"]/*[[".cells.staticTexts[\"Music\"]",".staticTexts[\"Music\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Music"].buttons["New Card"].tap()
        
        let titleExFormula25MajorScaleTextField = app.textFields["Title: ex, Formula 25, Major Scale"]
        titleExFormula25MajorScaleTextField.tap()
        titleExFormula25MajorScaleTextField.typeText("Guitar Players")
        app.typeText("\r")
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textView = element.children(matching: .textView).element(boundBy: 0)
        textView.tap()
        textView.tap()
        textView.typeText("who is the most famous guitarists?")
        
        let textView2 = element.children(matching: .textView).element(boundBy: 1)
        textView2.tap()
        textView2.tap()
        textView2.typeText("Answer:\r")
        textView2.typeText("- Jimi")
        textView2.typeText(" Hendrix")
        app.navigationBars["New Card"].buttons["Create"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Guitar Players"]/*[[".cells.staticTexts[\"Guitar Players\"]",".staticTexts[\"Guitar Players\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Guitar Players"].buttons["Reveal"].tap()
        
    }
    func testSignOut(){
        let app = XCUIApplication()
        app.tabBars.buttons["Account"].tap()
        app.navigationBars["FlashCards.AccountView"].buttons["Sign Out"].tap()

    }
    
    
}
