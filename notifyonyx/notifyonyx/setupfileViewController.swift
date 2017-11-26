//
//  setupfileViewController.swift
//  notifyonyx
//
//  Created by Landon Vago-Hughes on 26/11/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit

class setupfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var backvierw: UIView!
    @IBOutlet weak var filename: UITextField!
    @IBOutlet weak var imageoffile: UIImageView!
    var imgDataNSString: NSData = NSData()
    var imageSize: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.backvierw.layer.cornerRadius = 20
        self.imageoffile.backgroundColor = UIColor.gray
    }
    
    @IBAction func sendfiletoonyx(_ sender: Any) {
        if imageToStore != UIImage() {
            
            if let imageData = UIImagePNGRepresentation(imageToStore){
            
                let strBase64 = imgDataNSString.base64EncodedString(options: .lineLength64Characters)
                print(strBase64)
                
                var uidToServer : String = ""
                
                let uidObject = UserDefaults.standard.object(forKey: "uid")
                if let uid = uidObject as? String {
                    
                    print(uid)
                    uidToServer = String(uid)
                    
                }
                
                if let userInputFileName = fileNameTxtField.text{
                    
                    var sendToServer : Dictionary<String, String> = ["uid":uidToServer,"filename":userInputFileName, "filesize":String(imageSize), "base64StrImage":strBase64]
                    
                    
                    
                    
                }
                
            }
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageoffile.image = image
            imgDataNSString = NSData(data: UIImagePNGRepresentation((image))!)
            imageSize = imgDataNSString.length
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoBtn(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
        
    }
    
}
