//
//  ViewController.swift
//  hometask_3
//
//  Created by Admin on 02.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var notes: [String]  = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func insertButton(_ sender: UIButton) {
        let text = textField.text!
        if !text.isEmpty {
            self.notes.append(text)
            textField.text = nil
            
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
}
