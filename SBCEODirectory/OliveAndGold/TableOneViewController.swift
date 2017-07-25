//
//  TableOneViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit
import MessageUI

class TableOneViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    var employees = [String!]()
    var employeesTemp = CellElements.sharedInstance.newArrays
    
    var filteredEmployees = [String!]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        for catagories in employeesTemp {
            for employee in catagories! {
                employees.append(employee)
            }
        }
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredEmployees = employees.filter { $0.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredEmployees.count
        }
        return CellElements.sharedInstance.oneElementsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElementRow", for: indexPath)
        let label = cell.viewWithTag(11) as! UILabel
        let categories = CellElements.sharedInstance.oneElementsArray
        
        if searchController.isActive && searchController.searchBar.text != "" {
            label.text = filteredEmployees[indexPath.row]
        } else {
            label.text = categories?[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //if search bar isnt empty skip the second vc
        if searchController.isActive && searchController.searchBar.text != "" {
            performSegue(withIdentifier: "pushToEmployeeView", sender: tableView.cellForRow(at: indexPath))
        }
        // if search bar is empty go the usual way
        else{
            performSegue(withIdentifier: "pushToSecondView", sender: tableView.cellForRow(at: indexPath))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check which segue it is and give info as necessary
        if segue.identifier == "pushToSecondView"{
            let secondCells = segue.destination as! SecondViewController
//            let cellRow = sender as! UITableViewCell
            let rowNum = tableView.indexPath(for: sender as! UITableViewCell)?.row
            let categories = CellElements.sharedInstance.oneElementsArray

            secondCells.navigationItem.title = categories?[rowNum!]
            secondCells.cellArray = CellElements.sharedInstance.newArrays[rowNum!]
            secondCells.firstTableNum = rowNum
        }
        else if segue.identifier == "pushToEmployeeView"{
            //fix this to go to the next view, I really dont know how
            let controller = segue.destination as! CounselorViewController
            let rowNum = tableView.indexPath(for: sender as! UITableViewCell)?.row
            
            controller.employeeName = filteredEmployees[rowNum!]
        }
        else{
            print("invalid sague in tableOneVC")
        }
    }
}

extension TableOneViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    }
}
