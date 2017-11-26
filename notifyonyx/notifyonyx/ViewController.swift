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
        
        
        
    }

}

