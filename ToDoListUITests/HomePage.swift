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
    private var notesTitle : XCUIElement!
    private var addButton : XCUIElement!
    private var editButton : XCUIElement!
    private var deleteButton : XCUIElement!
    private func noteAdded(_str: String) -> XCUIElement { return app.tables.staticTexts[_str] }
    private func tablesQuery(_str: String) -> XCUIElement { return app.tables.cells.element(boundBy: 0).buttons["Delete " + _str]}
    
    override var Trait: XCUIElement! {
        return app.navigationBars["Notes"].staticTexts["Notes"]
    }
    
    @discardableResult
     override init() {
        super.init()
        
        notesTitle = app.navigationBars["Notes"].staticTexts["Notes"]
        addButton = app.navigationBars["Notes"].buttons["addButton"]
        editButton = app.buttons["editButton"]
        deleteButton = app.tables.buttons["Delete"]
    }
    
    
    //page methods
    func verifyOnPage() {

        XCTAssertEqual(notesTitle.exists, true)
        MCLabel.labelStep("Verified on Home Page")
    }
    
    func selectAddNote() {

        MCLabel.labelStep("Tapping on Add Button")
        addButton.tap()
        
    }
    
    func verifyNote(noteValue : String) {
        
        waitForElement((noteAdded(_str: noteValue)), timeout: 3)
        MCLabel.labelStep("Note with \(noteValue) added")
    }
    
    @discardableResult
    func enterEditMode() -> HomePage {
        
        MCLabel.labelStep("Entering Edit Mode")
        editButton.tap()
        
        return self
    }
    
    @discardableResult
    func deleteRow(deleteValue : String) -> HomePage {

        tablesQuery(_str: deleteValue).tap()
        MCLabel.labelStep("In Delete Mode")
        deleteButton.tap()
        MCLabel.labelStep("Row Deleted")
        
        return self
    }
    
    func exitEditMode() {
        
        editButton.tap()
        MCLabel.labelStep("Exited Edit mode")

    }
}
