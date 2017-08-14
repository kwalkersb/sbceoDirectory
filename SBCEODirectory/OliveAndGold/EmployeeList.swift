//
//  EmployeeList.swift
//  SBCEO Directory
//
//  Created by Mobile on 7/24/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import Foundation
import Firebase

class EmployeeList {
    static let sharedInstance = EmployeeList()  // Initialization of this singleton.
    let defaults = UserDefaults.standard  // This is for storing data when app closes. All documentation about UserDefaults can be found from Apple.
    var employeeDictionary: [String: [EmployeeData]]  // Dictionary in which the directory is held locally during runtime.
    var subsectionTemp: [EmployeeData]  // Used as a temporary container for each subsection before they are added to employeeDictionary
    var ref: DatabaseReference?  // Reference to Firebase database
    
    //this was in the original app from last year, 2016, it contains a list of all the departments in a specific order
    let oneElementsArray: [String] =  ["Superintendent", "Deputy Superintendent", "Administrative Services", "Curriculum and Instruction", "Education Services", "Human Resources", "Special Education"] // Departments
    
    
    //order for all the following properties matters cause they need to correspond with eachother
    
    // newArrays is an array of arrays of the names of all the employees, the outter array is by department
    var newArrays: [[String]?] = []
    // tempObjectArray is an array of arrays of all the employee data, the outter array is organized by department
    var tempObjectArray: [[[String]?]] = []

    
    // these contain a list of all the names in the respective department
    // each number coresponds to whatever department in the above stated array: oneElementsArray
    var cell0: [String] = [] //cell0[0] would contain the name of the first person in the superintendant department
    var cell1: [String] = []
    var cell2: [String] = []
    var cell3: [String] = []
    var cell4: [String] = []
    var cell5: [String] = []
    var cell6: [String] = []
    //once filled cell0 through cell6 get put into newArrays
    
    // these contain all the data of the employee for the respective department
    // each number coresponds to whatever department in the above stated array: oneElementsArray
    var cellD0: [[String]?] = [] // cellD0[0] would contain all the data on the first person in the superintendant department
    var cellD1: [[String]?] = []
    var cellD2: [[String]?] = []
    var cellD3: [[String]?] = []
    var cellD4: [[String]?] = []
    var cellD5: [[String]?] = []
    var cellD6: [[String]?] = []
    //once filled cellD0 through cellD6 get put into tempObjectArray
    
    
    private init() {
        // Initialization of properties (xcode doesn't like you trying to initialize them during declaration in this particular instance)
        employeeDictionary = [String: [EmployeeData]]()
        subsectionTemp = [EmployeeData]()
        ref = Database.database().reference()
        
        /* Rundown of this block: 
                1. Checks for connection to database and if it's there:
                    a. Pulls data from database
                    b. Handles data with method
                2. If there is no database connection it pulls data from local storage
        */
        if let reference = ref {  // 1.
            reference.child("employeeList").observeSingleEvent(of: .value, with: { snapshot in  // a.
                if let dictionary = snapshot.value as? [String: [String:AnyObject]] {
                    self.handleEmployeeList(with: dictionary)  // b. (data has to be pulled out with method because of asynchronous nature of closure)
                }
            })
        } else {
            self.handleEmployeeListWithLocalData()  // 2.
        }
    }
    
    func handleEmployeeList(with snapshot: [String: [String: AnyObject]]) {
        for subsection in snapshot {  // Runs through each employee subsection from dictionary
            subsectionTemp = []  // Resets subsectionTemp to empty whenever a new subsection is entered
            
            for item in subsection.value {  // Runs through each employee from subsection
                let employeeObject = EmployeeData(dictionary: item.value as! [String : AnyObject], valueKey: item.key)  // Initializes EmployeeData object from each subsection employee
                subsectionTemp.append(employeeObject)  // Appends new EmployeeData object
            }
            
            employeeDictionary[subsection.key] = subsectionTemp  // Populates employeeDictionary with newly populated subsection
        }
        
        // Archives employeeDictionary and saves it to local storage (UserDefaults) for persistence when app closes.
        let data = NSKeyedArchiver.archivedData(withRootObject: employeeDictionary)
        defaults.set(data, forKey: "employeeDictionary")
        
        let employeeList = employeeDictionary
        
        populateCells(with: employeeList)  // Populates all the weird arrays used for the table views
    }
    
    func handleEmployeeListWithLocalData() {
        // Grabs employeeDictionary from storage to be used in table
        guard let archivedData = UserDefaults.standard.value(forKey: "employeeDictionary") as? Data
            else{return}
        guard let unarchivedDictionary = NSKeyedUnarchiver.unarchiveObject(with: archivedData) as? [String: [EmployeeData]]
            else{return}
        
        populateCells(with: unarchivedDictionary)  // Populates all the weird arrays used for the table views
    }
    
    // fills the cells of the in app data structure; it fills all the cell# and cellD# properties and then adds them to their respective array
    func populateCells(with employeeList: [String: [EmployeeData]]) {
        
        //each one of thees for loops fill thier respective cell
        for ed in employeeList["Superintendent"]!{
            cell0.append(ed.name)  // this fills each superintendants name into the array
            cellD0.append(ed.data) // fills employee data into the array
        }
        for ed in employeeList["Deputy Superintendent"]!{
            cell1.append(ed.name)
            cellD1.append(ed.data)
        }
        for ed in employeeList["Administrative Services"]!{
            cell2.append(ed.name)
            cellD2.append(ed.data)
        }
        for ed in employeeList["Curriculum and Instruction"]!{
            cell3.append(ed.name)
            cellD3.append(ed.data)
        }
        for ed in employeeList["Educational Services"]!{
            cell4.append(ed.name)
            cellD4.append(ed.data)
        }
        for ed in employeeList["Human Resources"]!{
            cell5.append(ed.name)
            cellD5.append(ed.data)
        }
        for ed in employeeList["Special Education"]!{
            cell6.append(ed.name)
            cellD6.append(ed.data)
        }
        
        // filling the larger arrays with their data
        newArrays = [cell0, cell1, cell2, cell3, cell4, cell5, cell6]
        tempObjectArray = [cellD0, cellD1, cellD2, cellD3, cellD4, cellD5, cellD6]
    }
}
