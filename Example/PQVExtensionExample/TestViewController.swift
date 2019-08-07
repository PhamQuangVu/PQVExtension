//
//  TestViewController.swift
//  PQVExtensionExample
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import UIKit
import PQVExtension

class TestViewController: UIViewController {
    @IBOutlet var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }


    private func setupCollectionView() {
        self.collectionView.pqvRegisterCellNib(nibNames: TestCollectionViewCell.pqvDefaultIdentifier())
        self.collectionView.pqvSetupAutoLayoutCell().pqvSetupDefaulLayout { (layout) in
            layout.minimumInteritemSpacing = 0.0
            layout.minimumLineSpacing = 10.0
            //layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
}

extension TestViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.pqvDequeue(cellType: TestCollectionViewCell.self, at: indexPath) { (cell) in
            var title = "Title 1"
            var color = UIColor.pqvColorFromRGB(red: 100, green: 200, blue: 50, alpha: 1.0)
            if indexPath.row == 1 {
                title = "Title 2\nTitle 2"
                color = UIColor.pqvColorFromRGB(red: 255, green: 210, blue: 10, alpha: 1.0)
            }
            
            if indexPath.row == 2 {
                title = "Title 3\nTitle 3\nTitle 3"
                color = UIColor.pqvColorFromRGB(red: 130, green: 20, blue: 60, alpha: 1.0)
            }
            cell.label.text = title
            cell.backgroundColor = color
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
}
