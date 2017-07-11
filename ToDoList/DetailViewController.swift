//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    var text:String = ""
    var masterView:ViewController!
    var pickerDataSource = ["Batman", "Superman", "Wonder Woman", "Aquaman", "Cyborg", "Flash", "Martian ManHunter"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = text
        
        //to make keyboard open default
//        textView.becomeFirstResponder()
        
        //UIPickerView setup
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
    }

    @IBOutlet weak var `switch`: UISwitch!
    func setText(t:String) {
        text = t
        if isViewLoaded {
            textView.text = t
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = textView.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //funcs for UIPickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }

    //funcs for UISlider
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        let selectedValue = Int(sender.value)
        
        sliderLabel.text = "\(selectedValue)"
    }
  
    //funcs for UISwitch
    @IBAction func switchValueChanged(_ sender: Any) {
        
        if (switchButton.isOn) {
            switchLabel.text = "Switch is on"
        }
        else {
            switchLabel.text = "Off"
        }
    }
 
    
}
