//
//  WKWebViewExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation
import UIKit
import WebKit


public extension WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        UIAlertController.showAlert(message: message, buttonTitles: "OK") { (action) in
            completionHandler()
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        UIAlertController.showAlert(message: message, buttonTitles: "OK", "Cancel") { (action) in
            var result = false
            if action.title == "OK" {
                result = true
            }
            completionHandler(result)
        }
    }
}

