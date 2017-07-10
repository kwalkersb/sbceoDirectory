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
        
        for a in employeesTemp {
            for b in a! {
                employees.append(b)
            }
        }
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredEmployees = employees.filter { results in
            return results.lowercased().contains(searchText.lowercased())
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToSecondView"{
            let secondCells = segue.destination as! SecondViewController
            let cellRow = sender as! UITableViewCell
            let rowNum = tableView.indexPath(for: cellRow)?.row
            
            if searchController.isActive && searchController.searchBar.text != "" {
                secondCells.cellName = filteredEmployees[rowNum!]
                secondCells.cell = sender as! UITableViewCell
                secondCells.employeeList = employees
            }
            else {
                secondCells.cellArray = CellElements.sharedInstance.newArrays[rowNum!]
            }
            secondCells.firstTableNum = rowNum
        }
    }
}

extension TableOneViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
