//
//  ViewController.swift
//  ToDoList
//
//  Created by Sweekriti Satpathy on 6/29/17.
//  Copyright © 2017 Sweekriti Satpathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table: UITableView!
    var data:[String] = []
    var selectedRow:Int = -1
    var newRowText:String = ""
    var file:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Notes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        addButton.accessibilityLabel = "addButton"
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.accessibilityLabel = "editButton"
        
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        file = docsDir[0].appending("notes.txt")
        load()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedRow == -1 {
            return
        }
        data[selectedRow] = newRowText
        if newRowText == "" {
            data.remove(at: selectedRow)
        }
        table.reloadData()
        save()
    }

    //required for tablesource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //required for tablesource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    //add note
    func addNote() {
        if (table.isEditing) {
            return
        }
        let name:String = ""
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        table.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    //edit mode toggle
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
    }
    
    //puts table in edit mode
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
        save()
    }
    
    //delegate to select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }

    //getText for sending to next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView:DetailViewController = segue.destination as! DetailViewController
        selectedRow = table.indexPathForSelectedRow!.row
        detailView.masterView = self
        detailView.setText(t: data[selectedRow])
    }
    
    func save()
    {
        //userDefaults for saving data
//        UserDefaults.standard.set(data, forKey: "notes")
//        UserDefaults.standard.synchronize()
//
        
        //using file
        let newData: NSArray = NSArray(array: data)
        newData.write(toFile: file, atomically: true)
    }
    
    func load()
    {
        //userdefaults for loading data
//        if let loadedData = UserDefaults.standard.value(forKey: "notes") as? [String] {
//            data = loadedData
//            table.reloadData()
//        }
        
        //use file
        if let loadedData = NSArray(contentsOfFile:file) as? [String] {
                data = loadedData
                table.reloadData()
             }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

