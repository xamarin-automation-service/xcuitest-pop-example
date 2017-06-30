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
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //waitForElement
    func waitForElement(of element: XCUIElement, file: String = #file, line : UInt = #line, timeout: Double = 5) {
        
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
