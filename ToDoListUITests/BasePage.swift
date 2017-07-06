//
//  BasePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 7/6/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import XCTest
import VSMobileCenterExtensions

class BasePage {
    
    var app : XCUIApplication
    
    init() {
        app = BaseTest().getAppDriver()
    }
    
    func waitForElement(of element: XCUIElement, timeout: Double) {
        
        BaseTest().waitFor(of: element, timeout: timeout)
    }
    
    func assertOnPage() {
        
//        BaseTest().waitFor(of: traitValue, timeout:10)
//        MCLabel.labelStep("On Page")
    }
}
