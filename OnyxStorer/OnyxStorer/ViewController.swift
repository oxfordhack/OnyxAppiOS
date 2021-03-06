//
//  ViewController.swift
//  OnyxStorer
//
//  Created by Tanin on 25/11/2017.
//  Copyright © 2017 landtanin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Firebase
import FirebaseInstanceID

class ViewController: UIViewController {
    
    var phoneID : String = ""
    var allocatedStorageStr : String = ""
    
    let ENDPOINT_URL = "https://onyxx.herokuapp.com/storer/storersetup"
//    /192.76.8.77
//    94.119.64.18

    @IBOutlet var becomeStorerBtn: UIButton!
    @IBOutlet var allocatedStorageLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        phoneID = UIDevice.current.identifierForVendor!.uuidString
        phoneID = Messaging.messaging().fcmToken!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func becomeStorerAction(_ sender: UIButton) {
        
        if allocatedStorageLabel.text != "" {
            
            if let allocatedStorageCheck = allocatedStorageLabel.text {
            
                allocatedStorageStr = allocatedStorageCheck
                
                let sendToServer : Dictionary<String, String> = ["phoneid":phoneID, "allocatedmemory":allocatedStorageStr]
                
                Alamofire.request(ENDPOINT_URL, method: .post, parameters: sendToServer).responseJSON(completionHandler: { (response) in
                    
                    let callBackJSON : JSON = JSON(response.result.value!)
                    print(callBackJSON)
                
//                    if response.result
                    print(self.phoneID)
                    print("it works!")
                    
                })
                
            }
            
        } else {
            
            let alertController = UIAlertController(title: "Information needed", message: "Please specify the amount of storage you want to allocate to the system", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }

}

