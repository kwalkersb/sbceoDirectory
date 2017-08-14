//
//  counselorViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan Computer on 5/9/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//
import UIKit
import MessageUI

class CounselorViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    var tempObjectArray: [[[String]?]]!
    var objectArray: [[[String]?]]!
    var employeeName: String!
    var fillingArray: [[String]?] = []
    var newArray: [String]!
    var firstTableNum : Int!
    var rowNum: Int!
    var stringThing: String!
    
    var mailComposer: MFMailComposeViewController!

    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var ext: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fills the properties
        // multiple differnt ways because of search and normal transition give different data
        // it was already like this from last yeay (2016) so i dont really know whi it was done this way, but hey, it works
        if employeeName == nil {
            switch firstTableNum{
                case 0:
                    fillingArray = EmployeeList.sharedInstance.cellD0
                    break;
                case 1:
                    fillingArray = EmployeeList.sharedInstance.cellD1
                    break;
                case 2:
                    fillingArray = EmployeeList.sharedInstance.cellD2
                    break;
                case 3:
                    fillingArray = EmployeeList.sharedInstance.cellD3
                    break;
                case 4:
                    fillingArray = EmployeeList.sharedInstance.cellD4
                    break;
                case 5:
                    fillingArray = EmployeeList.sharedInstance.cellD5
                    break;
                case 6:
                    fillingArray = EmployeeList.sharedInstance.cellD6
                    break;
                default:
                    print("defaulted in counselorVC switch statement")
                    fillingArray = EmployeeList.sharedInstance.cellD0
            }
        }
        if employeeName != nil {
            tempObjectArray = EmployeeList.sharedInstance.tempObjectArray
            for employeeObjectList in tempObjectArray {
                for employeeObject in employeeObjectList {
                    if employeeName == employeeObject?[0] {
                        newArray = employeeObject
                    }
                }
            }
        }
        else {
            newArray = fillingArray[rowNum]
        }
        
        //sets the phone number to the screen and does the calling when tapped thing but currently dysfunctional due to poor data given to us
        
//        let phoneNumber1 = newArray[3][newArray[3].characters.index(newArray[3].startIndex, offsetBy: 0)...newArray[3].characters.index(newArray[3].startIndex, offsetBy: 2)]
//        let phoneNumber2 = newArray[3][newArray[3].characters.index(newArray[3].startIndex, offsetBy: 3)...newArray[3].characters.index(newArray[3].startIndex, offsetBy: 5)]
//        let phoneNumber3 = newArray[3][newArray[3].characters.index(newArray[3].startIndex, offsetBy: 6)...newArray[3].characters.index(newArray[3].startIndex, offsetBy: 9)]
        
        // sets the rest of the properties to storyboard elements
        job.text = newArray[1]
        email.setTitle(newArray[2], for: UIControlState())
        phone.setTitle("improper formatting for phone #", for: UIControlState())
        //phone.setTitle("(\(phoneNumber1)) \(phoneNumber2)-\(phoneNumber3)", for: UIControlState())
        //ext.text = "Ext: " + newArray[4]
        ext.text = "will be dealt with later?"
        
        
        navigationItem.title = newArray[0]
    }
    
    // action for when email is tapped you get a popup thing to send an email
    @IBAction func emailLaunch(_ sender: AnyObject) {
        configureMail(newArray[2])
    }
    // similar to above but for the phone and calling
    @IBAction func phoneLaunch(_ sender: AnyObject) {
        callNumber("\(newArray[3])", extensionNum: "\(newArray[4])")
    }
    
    fileprivate func callNumber(_ phoneNumber:String, extensionNum:String) {
        if let phoneCallURL:URL = URL(string: "tel://\(phoneNumber),\(extensionNum)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    // sets up the mail thing with popups and whatnot; not super sure how it works
    func configureMail(_ email: String){
        let sendTo = email
        mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients([sendTo])
        self.present(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        self.dismiss(animated: true, completion: nil)
        mailComposer = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
