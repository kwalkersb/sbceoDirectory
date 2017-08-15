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
    
    
    var allEmployees = [String!]()
    var employeesTemp = EmployeeList.sharedInstance.newArrays
    
    var filteredEmployees = [String!]()
    
    var didGetAllEmployees = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        // for some reason when we first grabbed the new arrays from the shared instance it was just empty so we need to regrab it here and then we can properly fill allEmployees so the search can work properly
        if !didGetAllEmployees {
            employeesTemp = EmployeeList.sharedInstance.newArrays
            for division in employeesTemp {
                for employee in division! {
                    allEmployees.append(employee)
                }
            }
            didGetAllEmployees = true
        }
        
        filteredEmployees = allEmployees.filter { $0.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // designates the length of the table view, ie. number of cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredEmployees.count
        }
        return EmployeeList.sharedInstance.oneElementsArray.count
    }
    
    // fills the cells with proper label or somthing like that
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElementRow", for: indexPath)
        let label = cell.viewWithTag(11) as! UILabel
        let categories = EmployeeList.sharedInstance.oneElementsArray
        
        if searchController.isActive && searchController.searchBar.text != "" {
            label.text = filteredEmployees[indexPath.row]
        } else {
            label.text = categories[indexPath.row]
        }
        return cell
    }
    
    // because of the search, when a row is tapped it needs different instructions to get to the next viewController
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
    
    // see what segue is going and then appropriatly set values into the new viewControler
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check which segue it is and give info as necessary
        if segue.identifier == "pushToSecondView"{
            let secondCells = segue.destination as! SecondViewController
            let rowNum = tableView.indexPath(for: sender as! UITableViewCell)?.row
            let categories = EmployeeList.sharedInstance.oneElementsArray

            secondCells.navigationItem.title = categories[rowNum!]
            secondCells.cellArray = EmployeeList.sharedInstance.newArrays[rowNum!]
            secondCells.firstTableNum = rowNum
        }
        else if segue.identifier == "pushToEmployeeView"{
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
    }
}
