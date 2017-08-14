//
//  SecondViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    var employeeList : [String?]!
    var cellArray : [String]!
    var cell : UITableViewCell!
    var cellName : String!
    var firstTableNum : Int!
    var rowNum: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // designates the length of the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellArray == nil {
            return 1;
        }
        else {
            return cellArray.count
        }
    }
    
    // fills the cell with the correct label and whatnot
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryCells", for: indexPath)
        let label = cell.viewWithTag(5) as! UILabel
        if cellArray == nil {
            label.text = cellName;
        }
        else {
            label.text = cellArray[indexPath.row]
        }
        return cell
    }
    
    
    //sets up the next view controller with the name and employee info
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToThird"{
            let controller = segue.destination as! CounselorViewController
            let cellRow = sender as! UITableViewCell
            rowNum = tableView.indexPath(for: cellRow)?.row
            
            controller.firstTableNum = firstTableNum
            controller.rowNum = rowNum
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
        
       
        }
    }


