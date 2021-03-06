//
//  LoginViewController.swift
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

class LoginViewController: UIViewController {

    let ENDPOINT_URL = URL(string:"http://onyxx.herokuapp.com/poster/postersignin")
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logInTapped(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            SVProgressHUD.show()
            
            if error != nil{
                
                SVProgressHUD.dismiss()
                print(error)
                
            } else {
                
                print("Log in successful")
                
                SVProgressHUD.dismiss()
                
                print(user?.uid)
                let sendToServer : Dictionary = ["uid":user?.uid]
                
                Alamofire.request(self.ENDPOINT_URL!, method: .post, parameters: sendToServer).responseJSON(completionHandler: { (response) in

                    let callBackJSON : JSON = JSON(response.result.value!)
                    print(callBackJSON)


                    if callBackJSON["error"] == true{
                        self.performSegue(withIdentifier: "logInToFirstScreen", sender: self)
                    } else {
                        self.performSegue(withIdentifier: "goToFileList", sender: self)
                    }

                    print("it works!")

                })
            
                // save uid
                UserDefaults.standard.set(user?.uid, forKey: "uid")
                
                // ******************* MAKE SURE YOU DELETE THIS **********************************************
//                self.performSegue(withIdentifier: "logInToFirstScreen", sender: self)
                
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
