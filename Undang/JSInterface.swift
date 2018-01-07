//
//  JSInterface.swift
//  Undang
//
//  Created by YuJungin on 2018. 1. 6..
//  Copyright © 2018년 Unopen.Lab. All rights reserved.
//

import JavaScriptCore
import UIKit

@objc public protocol JSSystem: JSExport {
    func shareTemperature(_ message: JSValue)
}

class JSInterface: NSObject {
    
    weak var viewController: UIViewController?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension JSInterface: JSSystem {
    
    func shareTemperature(_ message: JSValue) {
        
        DispatchQueue.main.async {
            let activityVC = UIActivityViewController(activityItems: [message], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.viewController?.view
            self.viewController?.present(activityVC, animated: true, completion: nil)
        }
        
    }
}
