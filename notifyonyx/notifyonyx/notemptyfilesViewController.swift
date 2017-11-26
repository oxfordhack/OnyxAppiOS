//
//  notemptyfilesViewController.swift
//  notifyonyx
//
//  Created by Landon Vago-Hughes on 26/11/2017.
//  Copyright © 2017 Landon Vago-Hughes. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class notemptyfilesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableviewfiles: UITableView!
    var arrayoffilename: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let anime2 = starteranime()
        anime2.startAnimating()
        setupcell()
        fetchuploaderfiles().fetchexistingfiles(completion: {(files) in
            print(files.filearr)
            anime2.stopAnimating()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayoffilename.count
    }
    
    func setupcell(){
        let nib = UINib(nibName: "filenamesTableViewCell", bundle: nil)
        self.tableviewfiles.register(nib, forCellReuseIdentifier: "filecell")
    }
    
    func starteranime() -> NVActivityIndicatorView {
        let anime = NVActivityIndicatorView(frame: CGRect.zero, type: .ballPulse, color: UIColor.white, padding: 40.0)
        view.addSubview(anime)
        anime.snp.makeConstraints({(makes) -> Void in
            makes.centerX.equalToSuperview()
            makes.centerY.equalToSuperview()
        })
        return anime
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell3 = tableviewfiles.dequeueReusableCell(withIdentifier: "filecell", for: indexPath) as? filenamesTableViewCell else {
            return UITableViewCell()
        }
        
        let file = arrayoffilename[indexPath.row]
        cell3.configure(filename: file)
        return cell3
    }
}
