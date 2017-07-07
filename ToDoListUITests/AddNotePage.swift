//
//  AddNotePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//
import XCTest
import VSMobileCenterExtensions

class AddNotePage : BasePage {
    
    //queries
    var textView : XCUIElement?
    var backButton : XCUIElement?
    
    init() {
        super.init(trait: XCUIApplication().navigationBars["Note"].buttons["Notes"])
        
        //using textViews class and index 0
        //textView = app.textViews.element(boundBy: 0)
        
        //using accessibilityID aka ID
        textView = app.textViews.matching(identifier: "noteContentTextBox").element
        backButton = app.navigationBars["Note"].buttons["Notes"]
        
    }
    
    
    //page methods
    func addNote( textValue : String) -> Self {
    
        textView?.typeText(textValue)
        MCLabel.labelStep("Text entered : \(textValue)")
        
        return self
    }

    
    func saveNote(){
        
        MCLabel.labelStep("Saving note")
        backButton?.tap()
    }
    
}
