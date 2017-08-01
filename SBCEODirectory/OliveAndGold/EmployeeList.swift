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
    var ref: DatabaseReference!
    
    private init() {
        employeeDictionary = [String: [EmployeeData]]()
        ref = Database.database().reference()
        
        ref.child("employeeList").observeSingleEvent(of: .value, with: { snapshot in
            if let dictionary = snapshot.value as? [String: [String: AnyObject]] {
                for subsection in dictionary {
                    var subsectionEmployees: [EmployeeData] = []
                    
                    for item in subsection.value {
                        self.ref.child("employeeList/\(subsection.key)/\(item.key)").observeSingleEvent(of: .value, with: { employeeSnapshot in
                            let employeeObject = EmployeeData(snapshot: employeeSnapshot)
                            subsectionEmployees.append(employeeObject)
                            self.employeeDictionary[subsection.key] = subsectionEmployees
                            //print(self.employeeDictionary) This print statement prints out the expected data every time another employee is appended
                        })
                    }
                }
            }
            //print(self.employeeDictionary) This print statement prints an empty data structure
        })
    }
    
    func appendData(employeeObject employee: EmployeeData, subsectionArray subsection: inout [EmployeeData]){
        subsection.append(employee)
    }
}
