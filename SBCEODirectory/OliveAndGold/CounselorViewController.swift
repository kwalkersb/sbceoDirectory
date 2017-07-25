//
//  counselorViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan Computer on 5/9/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//
import UIKit
import MessageUI

class CounselorViewController: UIViewController, MFMailComposeViewControllerDelegate {

    // why do they need all of these??????
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
        
        if employeeName == nil {
            switch firstTableNum{
                case 0:
                    fillingArray = CellElements.sharedInstance.cellD0
                    break;
                case 1:
                    fillingArray = CellElements.sharedInstance.cellD1
                    break;
                case 2:
                    fillingArray = CellElements.sharedInstance.cellD2
                    break;
                case 3:
                    fillingArray = CellElements.sharedInstance.cellD3
                    break;
                case 4:
                    fillingArray = CellElements.sharedInstance.cellD4
                    break;
                case 5:
                    fillingArray = CellElements.sharedInstance.cellD5
                    break;
                case 6:
                    fillingArray = CellElements.sharedInstance.cellD6
                    break;
                default:
                    print("defaulted in counselorVC switch statement")
                    fillingArray = CellElements.sharedInstance.cellD0
            }
        }
        
        if employeeName != nil {
            tempObjectArray = CellElements.sharedInstance.tempObjectArray
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
        
        print("\n\n", newArray, "\n\n")
        
//        let phoneNumber1 = newArray[3][newArray[3].characters.index(newArray[3].startIndex, offsetBy: 0)...newArray[3].characters.index(newArray[3].startIndex, offsetBy: 2)]
//        let phoneNumber2 = newArray[3][newArray[3].characters.index(newArray[3].startIndex, offsetBy: 3)...newArray[3].characters.index(newArray[3].startIndex, offsetBy: 5)]
//        let phoneNumber3 = newArray[3][newArray[3].characters.index(newArray[3].startIndex, offsetBy: 6)...newArray[3].characters.index(newArray[3].startIndex, offsetBy: 9)]
        
        job.text = newArray[1]
        email.setTitle(newArray[2], for: UIControlState())
        phone.setTitle("will totally deal with this later", for: UIControlState())
        //phone.setTitle("(\(phoneNumber1)) \(phoneNumber2)-\(phoneNumber3)", for: UIControlState())
        //ext.text = "Ext: " + newArray[4]
        ext.text = "shhhhhh"
        
        
        navigationItem.title = newArray[0]
        
        
    }
    
    @IBAction func emailLaunch(_ sender: AnyObject) {
        configureMail(newArray[2])
    }

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
