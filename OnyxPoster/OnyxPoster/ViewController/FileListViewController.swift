//
//  FileListViewController.swift
//  OnyxPoster
//
//  Created by Tanin on 25/11/2017.
//  Copyright © 2017 landtanin. All rights reserved.
//

import UIKit

class FileListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var fileListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fileListTableView.delegate = self
        fileListTableView.dataSource = self
        
        fileListTableView.register(UINib(nibName: "FileTableViewCell", bundle: nil), forCellReuseIdentifier: "fileNameCell")
        
        configureTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fileNameCell", for: indexPath) as? FileTableViewCell
        
        var fakeData = ["photo1", "photo2", "photo3"]
        cell?.fileNameLabel.text = fakeData[indexPath.row]
        
        return cell!
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func configureTableView() {
        fileListTableView.rowHeight = UITableViewAutomaticDimension
        fileListTableView.estimatedRowHeight = 120.0
    }

}
