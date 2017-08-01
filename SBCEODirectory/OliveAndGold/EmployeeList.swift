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
    }
    
    func appendToSubsectionTempWith(employeeDict: [String: AnyObject], itemKey: String) {
        let employeeObject = EmployeeData(dictionary: employeeDict, valueKey: itemKey)
        print(employeeObject.name)
        subsectionTemp.append(employeeObject)
    }
}
