//
//  ViewExtension.swift
//  PQVExtension
//
//  Created by VU on 9/23/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable private var DMBackground : UIColor? {
        get {
            return backgroundColor
        }
        set(color) {
            if #available(iOS 13, *) {
                let colorLight = backgroundColor?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .light))
                let colorDark = backgroundColor?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))
                if colorLight != colorDark {
                    return
                }
                
                let singleColor = backgroundColor
                backgroundColor = UIColor(dynamicProvider: { (trait) -> UIColor in
                    if trait.userInterfaceStyle == UIUserInterfaceStyle.light {
                        return singleColor ?? UIColor.white
                    }
                    return color ?? UIColor.red
                })
            }
        }
    }
}
