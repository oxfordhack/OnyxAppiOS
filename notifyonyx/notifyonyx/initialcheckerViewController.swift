//
//  initialcheckerViewController.swift
//  notifyonyx
//
//  Created by Landon Vago-Hughes on 26/11/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import NVActivityIndicatorView
import SnapKit
import FirebaseDatabase

class initialcheckerViewController: UIViewController, UITextFieldDelegate {
//    @IBOutlet weak var loginload: NVActivityIndicatorView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.username.delegate = self
        self.password.delegate = self
    }
    
    func startanime() -> NVActivityIndicatorView {
        let anime = NVActivityIndicatorView(frame: CGRect.zero, type: .ballPulse, color: UIColor.white, padding: 40.0)
        view.addSubview(anime)
        anime.snp.makeConstraints({(makes) -> Void in
            makes.centerX.equalToSuperview()
            makes.centerY.equalToSuperview().inset(-self.view.layer.frame.height*0.2)
        })
        return anime
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.view.frame.origin.y -= 100
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.frame.origin.y += 100
        self.view.endEditing(true)
    }
    
    @IBAction func login(_ sender: Any) {
        let white = startanime()
        if username.text! == "" && password.text! == "" {
            return
        }else{
            white.startAnimating()
            let ref = Database.database().reference(fromURL: "https://onyxnotify.firebaseio.com/")
            Auth.auth().signIn(withEmail: username.text!, password: password.text!, completion: {result, error in
                self.performSegue(withIdentifier: "notemptyfiles", sender: nil)
                white.stopAnimating()
            })
        }
    }
}
