//
//  LabelExtension.swift
//  PQVExtension
//
//  Created by VU on 9/23/19.
//  Copyright © 2019 VuPham. All rights reserved.
//


import Foundation
import UIKit

extension UILabel {
    @IBInspectable private var DMTextColor : UIColor? {
        get {
            return textColor
        }
        set(color) {
            if #available(iOS 13, *) {
                let colorLight = textColor?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .light))
                let colorDark = textColor?.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))
                if colorLight != colorDark {
                    return
                }
                
                let singleColor = textColor
                textColor = UIColor(dynamicProvider: { (trait) -> UIColor in
                    if trait.userInterfaceStyle == UIUserInterfaceStyle.light {
                        return singleColor ?? UIColor.white
                    }
                    return color ?? UIColor.red
                })
            }
        }
    }
}
