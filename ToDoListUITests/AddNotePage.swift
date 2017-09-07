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
    private var textView : XCUIElement!
    private var backButton : XCUIElement!
    private var switchButton : XCUIElement!
    private var sliderView : XCUIElement!
    private var pickerView : XCUIElement!
    
    override var Trait: XCUIElement! {
        return app.navigationBars["Note"].buttons["Notes"]
    }
    
    @discardableResult
    override init() {
        super.init()
        
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
    @discardableResult
    func addNote( textValue : String) -> Self {
        
        textView.tap()
        textView.typeText(textValue)
        MCLabel.labelStep("Text entered : \(textValue)")
        
        return self
    }

    
    func saveNote(){
        
        MCLabel.labelStep("Saving note")
        backButton.tap()
    }
    
    @discardableResult
    func changeSwitchState() -> Self{
        
        switchButton.tap()
        MCLabel.labelStep("Switch Value changed")
        
        return self
        
    }
    
    @discardableResult
    func changeSliderValue(newValue : CGFloat) -> Self {
        
        sliderView.adjust(toNormalizedSliderPosition: newValue)
        MCLabel.labelStep("Slider Value set to : \(newValue)")
        
        return self
    }
    
    @discardableResult
    func selectSuperHero(superheroName : String) -> Self {
        
        pickerView.adjust(toPickerWheelValue: superheroName)
        MCLabel.labelStep("Picker View set to : \(superheroName)")
        return self
    }
    
}
