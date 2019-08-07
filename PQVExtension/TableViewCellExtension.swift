//
//  TableviewCellExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    
    // return table view cell that has been registered with default identifier
    static func pqvDequeueDefault<T : UITableViewCell>(from tableView: UITableView, at indexPath: IndexPath)-> T? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.pqvDefaultIdentifier(), for: indexPath) as? T {
            return cell
        }
        return nil
    }
}
