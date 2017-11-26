//
//  FirstScreenViewController.swift
//  OnyxPoster
//
//  Created by Tanin on 25/11/2017.
//  Copyright © 2017 landtanin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class FirstScreenViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var sampleImage: UIImageView!
    @IBOutlet var fileNameTxtField: UITextField!
    var imageToStore : UIImage = UIImage()
    var imageSize: Int = 0
    let ENDPOINT_URL = URL(string:"http://localhost:3000/poster/postfile")
    var imgDataNSString: NSData = NSData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addPhotoBtn(_ sender: UIButton) {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false

        present(imagePicker, animated: true, completion: nil)

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {

            imageToStore = image
            sampleImage.image = image

//            imgDataNSString = NSData(data: UIImageJPEGRepresentation((image), 1)!)
            imgDataNSString = NSData(data: UIImagePNGRepresentation((image))!)
            
            // var imgData: NSData = UIImagePNGRepresentation(image)
            // you can also replace UIImageJPEGRepresentation with UIImagePNGRepresentation.
            imageSize = imgDataNSString.length
            print("size of image in KB: %f ", Double(imageSize) / 1024.0)

        }

        dismiss(animated: true, completion: nil)

    }
    @IBAction func uploadTapped(_ sender: UIButton) {

        if imageToStore != UIImage() {

            if let imageData = UIImagePNGRepresentation(imageToStore){

                // send 3 things
                // file name
                // binary file
                // file size
                
                // convert image to base 64
                let strBase64 = imgDataNSString.base64EncodedString(options: .lineLength64Characters)
                print(strBase64)
                
                // retreive uid from UserDefault
                var uidToServer : String = ""

                let uidObject = UserDefaults.standard.object(forKey: "uid")
                if let uid = uidObject as? String {
                    
                    print(uid)
                    uidToServer = String(uid)
                    
                }
  
                
                if let userInputFileName = fileNameTxtField.text{
                
                    var sendToServer : Dictionary<String, String> = ["uid":uidToServer,"filename":userInputFileName, "filesize":String(imageSize), "base64StrImage":strBase64]
                    
                    SVProgressHUD.show()
                    
                    Alamofire.request(self.ENDPOINT_URL!, method: .post, parameters: sendToServer).responseJSON(completionHandler: { (response) in

                        let callBackJSON : JSON = JSON(response.result.value!)
                        print(callBackJSON)
                        
                        // receive status and array of file name
                        if callBackJSON["callback"] == true {
                            
                            let arrayRetured = callBackJSON["callback"]["message"].stringValue
                            print("we got data \(arrayRetured)")
                            
                        } else {
                            
                            print("No data")
                            
                        }
                        
                        SVProgressHUD.dismiss()

                    })
                    
                }

            }

        }

    }
    
    // prgm mark ----
    
    // convert images into base64 and keep them into string
    
//    func convertImageToBase64(image: UIImage) -> String {
//
//        var imageDataConvert = UIImagePNGRepresentation(image)
//        let base64String = imageDataConvert.base64EncodedString(options: .allZeros)
//
//        return base64String
//
//    }// end convertImageToBase64
//
//
//    // prgm mark ----
//
//    // convert images into base64 and keep them into string
//
//    func convertBase64ToImage(base64String: String) -> UIImage {
//
//        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0) )
//
//        var decodedimage = UIImage(data: decodedData!)
//
//        return decodedimage!
//
//    }// end convertBase64ToImage

    
}
