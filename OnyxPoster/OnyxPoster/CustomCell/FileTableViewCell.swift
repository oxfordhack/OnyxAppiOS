//
//  FileTableViewCell.swift
//  OnyxPoster
//
//  Created by Tanin on 25/11/2017.
//  Copyright © 2017 landtanin. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet var fileNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
