//
//  BasePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 7/6/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import XCTest
import VSMobileCenterExtensions
import CoreFoundation

class BasePage {
    
    var app : XCUIApplication
    var testCase = XCTestCase()

    init(trait: XCUIElement) {
        
        app = BaseTest().getAppDriver()
        assertOnPage(traitValue: trait)
    }
    
    //waitForElement
    func waitForElement(of element: XCUIElement,  timeout: Double = 5, file: String = #file, line : UInt = #line) {
        
        let predicate = NSPredicate(format: "exists == true")
        testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
        
        testCase.waitForExpectations(timeout: timeout) { (error) in
            guard error != nil else {return}
            
            let description = "\(element) does not exist after \(timeout) seconds."
            self.testCase.recordFailure(withDescription: description, inFile: file, atLine: line, expected: true)
            print(element.debugDescription)
            
        }
        
    }
    
    func assertOnPage(traitValue: XCUIElement) {
 
        waitForElement(of: traitValue, timeout:10)
        MCLabel.labelStep("On Page " + String(describing: self).components(separatedBy: ".")[1])
    }
}
