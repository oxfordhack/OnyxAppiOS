//
//  fetchuploaderfiles.swift
//  notifyonyx
//
//  Created by Landon Vago-Hughes on 26/11/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class fetchuploaderfiles {
    
    let uid = Auth.auth().currentUser?.uid
    let ref = Database.database().reference(fromURL: "https://onyxnotify.firebaseio.com/")
    struct snapshotfiles {
        let filearr: DataSnapshot!
    }
    
    func fetchexistingfiles(completion: @escaping(snapshotfiles) -> Void) {
        ref.child("onyxnotify").child("uploader").child("userid").observe(.value, with: { (snapshot) in
            if snapshot.exists() {
                let newsnap = snapshot.childSnapshot(forPath: "files")
                completion(snapshotfiles(filearr: newsnap))
            } else {
                completion(snapshotfiles(filearr: nil))
            }
        })
    }
}
