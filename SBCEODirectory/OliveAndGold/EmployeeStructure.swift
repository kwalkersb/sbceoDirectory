//
//  EmployeeStructure.swift
//  SBCEO Directory
//
//  Created by Mobile on 7/18/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import Foundation
import Firebase

struct employeeData {
    let name: String
    let division: String
    let job: String
    let ext: String
    let email: String
    let reference: DatabaseReference?
    let key: String
    
    init(name n: String, division d: String, job j: String, ext ex: String, email e: String, key k: String) {
        name = n
        division = d
        job = j
        ext = ex
        email = e
        reference = nil
        key = k
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        division = snapshotValue["division"] as! String
        job = snapshotValue["job"] as! String
        ext = snapshotValue["ext"] as! String
        email = snapshotValue["email"] as! String
        reference = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "division": division,
            "job": job,
            "ext": ext,
            "email": email
        ]
    }
}
