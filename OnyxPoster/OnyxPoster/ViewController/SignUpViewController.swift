//
//  SignUpViewController.swift
//  OnyxPoster
//
//  Created by Tanin on 25/11/2017.
//  Copyright © 2017 landtanin. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    let ENDPOINT_URL = URL(string:"http://localhost:3000/poster/postercreate")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        
        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                SVProgressHUD.dismiss()
                print(error)
            } else {
                // success
                print("Registration successful")
                SVProgressHUD.dismiss()
                
                let sendToServer : Dictionary = ["uid":user?.uid]
                
                Alamofire.request(self.ENDPOINT_URL!, method: .post, parameters: sendToServer).responseJSON(completionHandler: { (response) in
                    
                    let callBackJSON : JSON = JSON(response.result.value!)
                    print("this is callBackJSON = \(callBackJSON)")
                    
                    self.performSegue(withIdentifier: "signUpToFirstScreen", sender: self)
                    
                    print("it works!")
                    
                })
                
                // save uid
                UserDefaults.standard.set(user?.uid, forKey: "uid")
                
                print("this is uid =  + \(user?.uid)")
                
            }
            
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
