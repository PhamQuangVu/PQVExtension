//
//  NSObjectExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation

public extension NSObject {
    
    // return class name of NSObject class (mostly used for view and cell which has the same name as nibs)
    static func pqvDefaultIdentifier() -> String {
        return String(describing: self)
    }
}
