//
//  ViewControllerExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation

public extension UIViewController {
    
    // return current top most view controller
    static func pqvTopMostController<T: UIViewController>(excludedClasses : Array<T.Type> = [UIAlertController.self] as! Array<T.Type>) -> UIViewController? {
        var topController : UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        if topController == nil {
            topController = UIApplication.shared.delegate?.window??.rootViewController
        }
        while topController?.presentedViewController != nil {
            if let unwrapped = topController?.presentedViewController {
                let isExcluded = excludedClasses.contains(where: { (t : T.Type) -> Bool in
                    return type(of: unwrapped) == t
                })
                if isExcluded == true {
                    break
                }
            }
            
            topController = topController?.presentedViewController
        }
        return topController
    }
    
//    static func pqvDefaultViewController<T: UIViewController>(bundle : Bundle? = nil) -> T {
//        return T.init(nibName: T.pqvDefaultIdentifier(), bundle: bundle)
//    }
    
}
