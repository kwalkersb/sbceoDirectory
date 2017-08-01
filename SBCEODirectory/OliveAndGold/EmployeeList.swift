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
    static let sharedInstance = EmployeeList()
    var employeeDictionary: [String: [EmployeeData]]
    var subsectionTemp: [EmployeeData]
    var ref: DatabaseReference!
    
    //copying their data accessors so we dont have to change their crap
    let oneElementsArray: [String] =  ["Superintendent", "Deputy Superintendent", "Administrative Services", "Curriculum and Instruction", "Education Services", "Human Resources", "Special Education"] // Departments
    var newArrays: [[String]?] = []
    var tempObjectArray: [[[String]?]] = []

    
    var cell0: [String] = []
    var cell1: [String] = []
    var cell2: [String] = []
    var cell3: [String] = []
    var cell4: [String] = []
    var cell5: [String] = []
    var cell6: [String] = []
    
    var cellD0: [[String]?] = []
    var cellD1: [[String]?] = []
    var cellD2: [[String]?] = []
    var cellD3: [[String]?] = []
    var cellD4: [[String]?] = []
    var cellD5: [[String]?] = []
    var cellD6: [[String]?] = []

    
    private init() {
        employeeDictionary = [String: [EmployeeData]]()
        subsectionTemp = [EmployeeData]()
        ref = Database.database().reference()
        
        ref.child("employeeList").observeSingleEvent(of: .value, with: { snapshot in
            if let dictionary = snapshot.value as? [String: [String:AnyObject]] {
                self.handleEmployeeListWithValue(snapshot: dictionary)
            }
        })
        
        print(employeeDictionary["Superintendent"]?[0].name)
    }
    
    func handleEmployeeListWithValue(snapshot: [String: [String: AnyObject]]) {
        for subsection in snapshot {
            subsectionTemp = []
            
            for item in subsection.value {
                let employeeObject = EmployeeData(dictionary: item.value as! [String : AnyObject], valueKey: item.key)
                subsectionTemp.append(employeeObject)
            }
            
            employeeDictionary[subsection.key] = subsectionTemp
        }
        
        print(EmployeeList.sharedInstance.employeeDictionary)
        // cell# are used to fill out table views
        // cellD# is used to fill out
        let employeeList = EmployeeList.sharedInstance.employeeDictionary
        
        for ed in employeeList["Superintendent"]!{
            cell0.append(ed.name)
            cellD0.append(ed.data)
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
        
        newArrays = [cell0, cell1, cell2, cell3, cell4, cell5, cell6]
        tempObjectArray = [cellD0, cellD1, cellD2, cellD3, cellD4, cellD5, cellD6]
    }
    
    func appendToSubsectionTempWith(employeeDict: [String: AnyObject], itemKey: String) {
        let employeeObject = EmployeeData(dictionary: employeeDict, valueKey: itemKey)
        print(employeeObject.name)
        subsectionTemp.append(employeeObject)
    }
}
