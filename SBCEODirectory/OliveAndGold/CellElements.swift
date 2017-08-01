//
//  Elements.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import Foundation

class CellElements {
    
    static let sharedInstance = CellElements()
    let oneElementsArray: [String]! // Departments
    let newArrays: [[String]?]
    var tempObjectArray: [[[String]?]]!
    
    //the employeeList singleton
    let employeeList = EmployeeList.sharedInstance.employeeDictionary
    
    var cell0: [String]!
    var cell1: [String]!
    var cell2: [String]!
    var cell3: [String]!
    var cell4: [String]!
    var cell5: [String]!
    var cell6: [String]!
    
    var cellD0: [[String]?]!
    var cellD1: [[String]?]!
    var cellD2: [[String]?]!
    var cellD3: [[String]?]!
    var cellD4: [[String]?]!
    var cellD5: [[String]?]!
    var cellD6: [[String]?]!
    
    
    init()
    {   // array of different divisions
        oneElementsArray = ["Superintendent", "Deputy Superintendent", "Administrative Services", "Curriculum and Instruction", "Education Services", "Human Resources", "Special Education"]
        
        // cell# are used to fill out table views
        // cellD# is used to fill out
        
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
        for ed in employeeList["Education Services"]!{
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
}
