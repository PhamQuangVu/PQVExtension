//
//  TableviewExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    // register cell with a list of nib (set bundle if nibs are in another bundle)
    func pqvRegisterCellNib(nibNames : String..., bundle : Bundle? = nil) {
        for nibName in nibNames {
            self.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
        }
    }
    
    // register header footer with a list of nib (set bundle if nibs are in another bundle)
    func pqvRegisterHeaderFooterNib(nibNames : String..., bundle : Bundle? = nil) {
        for nibName in nibNames {
            self.register(UINib(nibName: nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: nibName)
        }
    }
    
    func pqvDequeue<T : UITableViewCell>(cellType : T.Type, at indexPath: IndexPath, configBlock : ((T)->())?)-> UITableViewCell {
        let generalCell = self.dequeueReusableCell(withIdentifier: T.pqvDefaultIdentifier(), for: indexPath)
        guard let specificCell = generalCell as? T else { return generalCell}
        configBlock?(specificCell)
        return specificCell
    }
}

