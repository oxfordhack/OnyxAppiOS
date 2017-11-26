//
//  filenamesTableViewCell.swift
//  notifyonyx
//
//  Created by Landon Vago-Hughes on 26/11/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit

class filenamesTableViewCell: UITableViewCell {

    @IBOutlet weak var filename: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(filename: String) {
        self.filename.setTitle(filename, for: .normal)
    }
    
    @IBAction func filefetch(_ sender: Any) {
        
    }
}
