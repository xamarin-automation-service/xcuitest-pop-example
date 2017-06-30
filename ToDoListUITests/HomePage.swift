//
//  HomePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//
import XCTest
import VSMobileCenterExtensions

class HomePage : BaseTest {
 
    //queries
    
    //page methods
    func VerifyOnPage() {
        
        let notesTitle = app.navigationBars["Notes"].staticTexts["Notes"]
        XCTAssertEqual(notesTitle.exists, true)
        
        MCLabel.labelStep("Verified on Home Page")
    }
    
    func selectAddNote() {
        
        let addButton = app.navigationBars["Notes"].buttons["addButton"]
        MCLabel.labelStep("Tapping on Add Button")
        addButton.tap()
        
    }
    
    func verifyNote(noteValue : String) {
        
        let noteAdded = app.tables.staticTexts[noteValue]
        waitForElement(of: noteAdded, timeout: 3)
        MCLabel.labelStep("Note with \(noteValue) added")
    }
    
    func enterEditMode() -> Self {
        
        let editButton = app.buttons["editButton"]
        MCLabel.labelStep("Entering Edit Mode")
        editButton.tap()
        
        return self
    }
    
    func deleteRow(rowNumber : UInt) -> Self {
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).matching(identifier: "cellRow").element(boundBy: 0).buttons["Delete Get Milk"].tap()
        
        let deleteButton = tablesQuery.buttons["Delete"]
        deleteButton.tap()
        
        MCLabel.labelStep("Row Deleted")
        
        return self
    }
    
    func exitEditMode() {
        
        let editButton = app.navigationBars["Notes"].buttons["editButton"]
        editButton.tap()
        MCLabel.labelStep("Exited Edit mode")

    }
}
