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
    let defaults = UserDefaults.standard
    static let sharedInstance = EmployeeList()
    var employeeDictionary: [String: [EmployeeData]]
    var subsectionTemp: [EmployeeData]
    var ref: DatabaseReference?
    
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
        employeeDictionary = [String: [EmployeeData]]()
        subsectionTemp = [EmployeeData]()
        ref = Database.database().reference()
        
        if let reference = ref {
            reference.child("employeeList").observeSingleEvent(of: .value, with: { snapshot in
                if let dictionary = snapshot.value as? [String: [String:AnyObject]] {
                    self.handleEmployeeList(with: dictionary)
                }
            })
        } else {
            self.handleEmployeeListWithLocalData()
        }
    }
    
    func handleEmployeeList(with snapshot: [String: [String: AnyObject]]) {
        for subsection in snapshot {
            subsectionTemp = []
            
            for item in subsection.value {
                let employeeObject = EmployeeData(dictionary: item.value as! [String : AnyObject], valueKey: item.key)
                subsectionTemp.append(employeeObject)
            }
            
            employeeDictionary[subsection.key] = subsectionTemp
        }
        
        let data = NSKeyedArchiver.archivedData(withRootObject: employeeDictionary)
        defaults.set(data, forKey: "employeeDictionary")
        
        let employeeList = employeeDictionary
        
        populateCells(with: employeeList)
    }
    
    func handleEmployeeListWithLocalData() {
        guard let archivedData = UserDefaults.standard.value(forKey: "employeeDictionary") as? Data
            else{return}
        guard let unarchivedDictionary = NSKeyedUnarchiver.unarchiveObject(with: archivedData) as? [String: [EmployeeData]]
            else{return}
        
        populateCells(with: unarchivedDictionary)
    }
    
    func appendToSubsectionTempWith(employeeDict: [String: AnyObject], itemKey: String) {
        let employeeObject = EmployeeData(dictionary: employeeDict, valueKey: itemKey)
        print(employeeObject.name)
        subsectionTemp.append(employeeObject)
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
