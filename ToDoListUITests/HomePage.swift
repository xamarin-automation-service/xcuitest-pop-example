//
//  HomePage.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import XCTest

class HomePage : BaseTest {
 
    //queries
    
    //page methods
    func VerifyOnPage() {
        
        let notesTitle = app.navigationBars["Notes"].staticTexts["Notes"]
        XCTAssertEqual(notesTitle.exists, true)
    }
    
    func selectAddNote() {
        
        let addButton = app.navigationBars["Notes"].buttons["addButton"]
        addButton.tap()
        
    }
    
    func verifyNote(noteValue : String) {
        
        let noteAdded = app.tables.staticTexts[noteValue]
        waitForElement(of: noteAdded, timeout: 3)
    }
    
    func enterEditMode() -> Self {
        
        let editButton = app.buttons["editButton"]
        editButton.tap()
        
        return self
    }
    
    func deleteRow(rowNumber : UInt) -> Self {
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).matching(identifier: "cellRow").element(boundBy: 0).buttons["Delete Tree"].tap()
        
        let deleteButton = tablesQuery.buttons["Delete"]
        deleteButton.tap()
        
        return self
    }
    
    func exitEditMode() {
        
        let editButton = app.navigationBars["Notes"].buttons["editButton"]
        editButton.tap()

    }
}
