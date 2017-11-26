//
//  ViewController.swift
//  notifyonyx
//
//  Created by Landon Vago-Hughes on 26/11/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Firebase
import FirebaseInstanceID

class ViewController: UIViewController {
    
    var phoneID : String = ""
    var allocatedStorageStr : String = ""

    @IBOutlet var allocatedStorageLabel: UITextField!
    @IBOutlet var becomeStorerBtn: UIButton!
    
    let ENDPOINT_URL = "https://onyxx.herokuapp.com/storer/storersetup"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

