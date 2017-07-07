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
    
    init(trait: XCUIElement, page : String) {
        app = BaseTest().getAppDriver()
        
        assertOnPage(traitValue: trait, pageValue: page)
    }
    
    func waitForElement(of element: XCUIElement, timeout: Double) {
        
        BaseTest().waitFor(of: element, timeout: timeout)
    }
    
    func assertOnPage(traitValue: XCUIElement, pageValue: String) {
 
        BaseTest().waitFor(of: traitValue, timeout:10)
        MCLabel.labelStep("On Page " + pageValue)
    }
}
