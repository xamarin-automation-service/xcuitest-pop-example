//
//  ToDoListUITests.swift
//  ToDoListUITests
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import XCTest

class ToDoListUITests: BaseTest  {
    
    func testAppLaunch() {

        HomePage()
            .VerifyOnPage()
    }
    
    func testAddNoteAndConfirm() {
        
        HomePage()
            .selectAddNote()
     
        AddNotePage()
            .addNote(textValue: "Get Milk")
            .saveNote()
        
        HomePage().verifyNote(noteValue: "Get Milk")
        
    }
    
    func testDeleteNoteAndConfirm() {

        HomePage()
            .enterEditMode()
            .deleteRow(deleteValue: "Get Milk")
            .exitEditMode()
    }
}
