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
    var switchButton : XCUIElement?
    var sliderView : XCUIElement?
    var pickerView : XCUIElement?
    
    init() {
        super.init(trait: XCUIApplication().navigationBars["Note"].buttons["Notes"])
        
        //using textViews class and index 0
        //textView = app.textViews.element(boundBy: 0)
        
        //using accessibilityID aka ID
        textView = app.textViews.matching(identifier: "noteContentTextBox").element
        backButton = app.navigationBars["Note"].buttons["Notes"]
        switchButton = app.switches["switchButton"]
        
        //if only single type of element exists
        sliderView = app.sliders.element
        pickerView = app.pickerWheels.element
    }

    //page methods
    func addNote( textValue : String) -> Self {
        
        textView?.tap()
        textView?.typeText(textValue)
        MCLabel.labelStep("Text entered : \(textValue)")
        
        return self
    }

    
    func saveNote(){
        
        MCLabel.labelStep("Saving note")
        backButton?.tap()
    }
    
    func changeSwitchState() -> Self{
        
        switchButton?.tap()
        MCLabel.labelStep("Switch Value changed")
        
        return self
        
    }
    
    func changeSliderValue(newValue : CGFloat) -> Self {
        
        sliderView?.adjust(toNormalizedSliderPosition: newValue)
        MCLabel.labelStep("Slider Value set to : \(newValue)")
        
        return self
    }
    
    func selectSuperHero(superheroName : String) -> Self {
        
        pickerView?.adjust(toPickerWheelValue: superheroName)
        MCLabel.labelStep("Picker View set to : \(superheroName)")
        return self
    }
    
}
