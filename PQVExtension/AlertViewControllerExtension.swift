//
//  AlertViewControllerExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation
import UIKit

public extension UIAlertController {
    
    // show alert view with button titles and actions
    static func showAlert(title : String = "", message : String = "", buttonTitles: String..., in viewController : UIViewController? = UIViewController.pqvTopMostController(), action:  ((UIAlertAction) -> ())?) {
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        for buttonTitle in buttonTitles {
            let okAction : UIAlertAction = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: action)
            alert.addAction(okAction)
        }
        viewController?.present(alert, animated: true, completion: nil)
    }
}
