//
//  FirstScreenViewController.swift
//  OnyxPoster
//
//  Created by Tanin on 25/11/2017.
//  Copyright © 2017 landtanin. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imageToStore : UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            
            
            var imgData: NSData = NSData(data: UIImageJPEGRepresentation((image), 1)!)
            // var imgData: NSData = UIImagePNGRepresentation(image)
            // you can also replace UIImageJPEGRepresentation with UIImagePNGRepresentation.
            var imageSize: Int = imgData.length
            print("size of image in KB: %f ", Double(imageSize) / 1024.0)
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func uploadTapped(_ sender: UIButton) {
        
        if imageToStore != UIImage() {
            
            if let imageData = UIImagePNGRepresentation(imageToStore){
                
                
                
            }
            
        }
        
    }
    
}
