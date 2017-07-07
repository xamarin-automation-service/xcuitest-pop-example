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
    var traitD : XCUIElement?
    
    init(trait: XCUIElement) {
        
        app = BaseTest().getAppDriver()
        assertOnPage(traitValue: trait)
    }
    
    func waitForElement(of element: XCUIElement, timeout: Double) {
        
        BaseTest().waitFor(of: element, timeout: timeout)
    }
    
    func assertOnPage(traitValue: XCUIElement) {
 
        BaseTest().waitFor(of: traitValue, timeout:10)
        print("On Page " + String(describing: self).components(separatedBy: ".")[1])
        MCLabel.labelStep("On Page " + String(describing: self).components(separatedBy: ".")[1])
    }
}
