//
//  StringExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    func pqvGenerateQRCode() -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
