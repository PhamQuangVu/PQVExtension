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

// japanese regex
public extension String {
    enum ProjectInputStringRegex: String {
        case Hiragana = "\\u3040-\\u309F"
        case KatakanaFullWidth = "\\u30A0—\\u30FF"
        case KatakanaHalfWidth = "\\uFF5F-\\uFF9F"
        case Kanji = "\\u3400-\\u4DB5\\u4E00-\\u9FCB\\uF900-\\uFA6A"
        case Numbernic = "０-９0-9"
        case Alpha = "Ａ-Ｚａ-ｚA-Za-z"
        case Other = "\\s,. 。，．"
    }
    func validWithRegex(regexString: String) -> Bool {
        if self.isEmpty || self.isEmpty {
            return false
        }
        let predecate = NSPredicate(format:"SELF MATCHES %@", regexString)
        return predecate.evaluate(with: self)
    }
    
    func validWithInputRegexs(regex: [ProjectInputStringRegex]) -> Bool {
        if self.isEmpty || regex.isEmpty {
            return false
        }
        let regexString = "^[\(regex.joinValue())]*$"
        return self.validWithRegex(regexString: regexString)
    }
    
    static let japaneseRegex: [ProjectInputStringRegex] = [.Hiragana,.KatakanaHalfWidth, .KatakanaHalfWidth, .Kanji, .Numbernic, .Alpha, .Other]
}
