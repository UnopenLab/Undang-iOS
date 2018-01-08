//
//  ViewController.swift
//  Undang
//
//  Created by Taewoo Lee on 2017. 12. 12..
//  Copyright © 2017년 Unopen.Lab. All rights reserved.
//

import UIKit


class MainVC: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHTML()
        myWebView.delegate = self
    }

    func loadHTML(){
        let url = URL(string : "http://undang.twpower.me:6231/")

        myWebView.addJavascriptInterface(JSInterface(viewController : self), forKey: "JSInterface");
        myWebView.loadRequest(URLRequest(url: url!))
        
    }
    
    deinit {
        myWebView.removeJavascriptInterfaces()
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}


