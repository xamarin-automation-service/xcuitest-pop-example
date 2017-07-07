//
//  HomePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//
import XCTest
import VSMobileCenterExtensions

class HomePage : BasePage {
    
    //queries
    var notesTitle : XCUIElement?
    var addButton : XCUIElement?
    var editButton : XCUIElement?
    var deleteButton : XCUIElement?
    func noteAdded(_str: String) -> XCUIElement { return app.tables.staticTexts[_str] }
    func tablesQuery(_str: String) -> XCUIElement { return app.tables.cells.element(boundBy: 0).buttons["Delete " + _str]}
    
     init() {
        super.init(trait: XCUIApplication().navigationBars["Notes"].staticTexts["Notes"])
        
        notesTitle = app.navigationBars["Notes"].staticTexts["Notes"]
        addButton = app.navigationBars["Notes"].buttons["addButton"]
        editButton = app.buttons["editButton"]
        deleteButton = app.tables.buttons["Delete"]
    }
    
    
    //page methods
    func VerifyOnPage() {

        XCTAssertEqual(notesTitle?.exists, true)
        MCLabel.labelStep("Verified on Home Page")
    }
    
    func selectAddNote() {

        MCLabel.labelStep("Tapping on Add Button")
        addButton?.tap()
        
    }
    
    func verifyNote(noteValue : String) {
        
        waitForElement(of: (noteAdded(_str: noteValue)), timeout: 3)
        MCLabel.labelStep("Note with \(noteValue) added")
    }
    
    func enterEditMode() -> HomePage {
        
        MCLabel.labelStep("Entering Edit Mode")
        editButton?.tap()
        
        return self
    }
    
    func deleteRow(deleteValue : String) -> HomePage {

        tablesQuery(_str: deleteValue).tap()
        deleteButton?.tap()
        MCLabel.labelStep("Row Deleted")
        
        return self
    }
    
    func exitEditMode() {
        
        editButton?.tap()
        MCLabel.labelStep("Exited Edit mode")

    }
}
