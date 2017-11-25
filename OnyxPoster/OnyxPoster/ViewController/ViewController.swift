//
//  ViewController.swift
//  OnyxPoster
//
//  Created by Tanin on 25/11/2017.
//  Copyright © 2017 landtanin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToLogin", sender: self)
        
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToSignUp", sender: self)
        
    }
    
}

