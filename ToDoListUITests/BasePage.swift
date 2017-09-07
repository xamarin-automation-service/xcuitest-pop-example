//
//  BasePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 7/6/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//


import VSMobileCenterExtensions
import CoreFoundation
import XCTest


class BasePage {
    
    let app = XCUIApplication()

    var Trait: XCUIElement! {
        return nil
    }
    
    var pageName: String! {
        return String(describing: self).components(separatedBy: ".")[1]
    }
    
    @discardableResult
    init() {
        waitForPage()
        MCLabel.labelStep("On Page " + pageName)
    }
    
    
    //waitForElement
    func waitForElement(_ element: XCUIElement,  timeout: Double = 5) {
  
        let testCase = XCTestCase()
        let exists:NSPredicate = NSPredicate.init(format:"exists == true")
        
        testCase.expectation(for: exists, evaluatedWith: element, handler: nil)
        testCase.waitForExpectations(timeout: TimeInterval(timeout), handler: nil)
    }
    
    func waitForPage() {
      
        if Trait == nil {
            fatalError("Trait not set for " + pageName)
        }
        
        waitForElement(Trait)
    }
}
