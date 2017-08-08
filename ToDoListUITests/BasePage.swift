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
    
    let app = XCUIApplication()
    
    var Trait: XCUIElement! {
        return nil
    }

    init() {
        waitForPage()
    }
    
    func waitForElement(_ element: XCUIElement,  timeout: Double = 5, file: String = #file, line : UInt = #line) {
        
        let testCase = XCTestCase()
        let predicate = NSPredicate(format: "exists == true")
        testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
        
        testCase.waitForExpectations(timeout: timeout) { (error) in
            guard error != nil else {return}
            
            let description = "\(element) does not exist after \(timeout) seconds."
            testCase.recordFailure(withDescription: description, inFile: file, atLine: line, expected: true)
            print(element.debugDescription)
            
        }
        
    }
    
    func waitForPage() {
        let pageName = String(describing: self).components(separatedBy: ".")[1]
        
        if Trait == nil {
            fatalError("Trait not set for " + pageName)
        }
        
        waitForElement(Trait)
        MCLabel.labelStep("On Page " + pageName)
    }
}
