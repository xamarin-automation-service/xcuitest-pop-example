//
//  AddNotePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//
import XCTest
import VSMobileCenterExtensions

class AddNotePage : BaseTest {
    
    //queries
    
    
    
    //page methods
    func addNote( textValue : String) -> Self {
        
        let textView = app.otherElements.containing(.navigationBar, identifier:"Note").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.typeText(textValue)
        
        MCLabel.labelStep("Text entered : \(textValue)")
        
        return self
    }
    
    func saveNote(){
        
        let backButton = app.navigationBars["Note"].buttons["Notes"]
        MCLabel.labelStep("Saving note")
        backButton.tap()
    }
    
}
