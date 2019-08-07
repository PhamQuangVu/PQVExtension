//
//  ArrayExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation

public extension Array {
    mutating func removeObject<T : Equatable>(_ obj : T) {
        self = self.filter({$0 as? T != obj})
    }
}
