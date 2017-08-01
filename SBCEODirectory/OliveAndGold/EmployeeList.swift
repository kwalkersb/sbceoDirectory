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
                    var name: String = "fail"
                    
                    for item in subsection.value {
                        self.ref.child("employeeList/\(subsection.key)/\(item.key)").observeSingleEvent(of: .value, with: { employeeSnapshot in
                            let employeeObject = EmployeeData(snapshot: employeeSnapshot)
                            subsectionEmployees.append(employeeObject)
                            name = "pass"
                            self.doSomethingAtTheEndOfTheClosureToAllowTimeForVariableSetting()
                            print("avery")
                        })
                        print("sucks\nlarge\npengoli")
                    }
                    print(name)
                    self.employeeDictionary[subsection.key] = subsectionEmployees
                }
            }
        })
        print("avri stupid")
        print(employeeDictionary)
    }
    
    func doSomethingAtTheEndOfTheClosureToAllowTimeForVariableSetting() {
        var num = 0
        num = 1
        num = 0
        num = 1
        num = 0
        num = 1
        num = 0
        num = 1
        num = 0
        num = 1
        num = 0
        num = 1
        num = 0
        num = 1
        num = 0
    }
}
