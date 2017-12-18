//
//  ViewController.swift
//  Undang
//
//  Created by Taewoo Lee on 2017. 12. 12..
//  Copyright © 2017년 Unopen.Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string : "http://www.naver.com") //test url for webview
        myWebView.loadRequest(URLRequest(url: url!))
        
    }

}

