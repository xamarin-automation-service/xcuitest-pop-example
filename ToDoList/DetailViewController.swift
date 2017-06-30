//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    var text:String = ""
    var masterView:ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = text
        
        //to make keyboard open default
        textView.becomeFirstResponder()
    }

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
