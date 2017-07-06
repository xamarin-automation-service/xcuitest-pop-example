//
//  BaseTestFixture.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import XCTest
import VSMobileCenterExtensions

class BaseTest : XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    func getAppDriver() -> XCUIApplication {
        return app
    }
    
    //waitForElement
    func waitFor(of element: XCUIElement,  timeout: Double = 5, file: String = #file, line : UInt = #line) {
        
        let predicate = NSPredicate(format: "exists == true")
        expectation(for: predicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: timeout) { (error) in
            guard error != nil else {return}
            
            let description = "\(element) does not exist after \(timeout) seconds."
            self.recordFailure(withDescription: description, inFile: file, atLine: line, expected: true)
            print(element.debugDescription)
            
        }
        
    }
    
}
