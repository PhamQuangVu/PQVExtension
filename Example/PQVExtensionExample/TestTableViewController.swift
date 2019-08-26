//
//  TestTableViewController.swift
//  PQVExtensionExample
//
//  Created by VU on 8/26/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import UIKit
import PQVExtension

class TestTableViewController: UIViewController {

    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }


    private func setupTableView() {
        self.tableView.pqvRegisterCellNib(nibNames: TestTableViewCell.pqvDefaultIdentifier())
    }
}

extension TestTableViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.pqvDequeue(cellType: TestTableViewCell.self, at: indexPath) { (testCell) in
            
            var color = UIColor.pqvColorFromRGB(red: 100, green: 200, blue: 50, alpha: 1.0)
            if indexPath.row == 1 {
                color = UIColor.pqvColorFromRGB(red: 255, green: 210, blue: 10, alpha: 1.0)
            }
            
            if indexPath.row == 2 {
                color = UIColor.pqvColorFromRGB(red: 130, green: 20, blue: 60, alpha: 1.0)
            }
            
            testCell.colorView.backgroundColor = color
        }
        return cell
    }
}
