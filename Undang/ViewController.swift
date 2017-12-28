//
//  ViewController.swift
//  Undang
//
//  Created by Taewoo Lee on 2017. 12. 12..
//  Copyright © 2017년 Unopen.Lab. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
         super.viewDidLoad()
         loadHTML()
         myWebView.delegate = self
    }

    func loadHTML(){
        let url = URL(string : "http://htmlpreview.github.com/?https://github.com/jungining/Undang-Web/blob/develop/index.html") //test url for webview
        myWebView.loadRequest(URLRequest(url: url!))
    }
  
    func shareCurrentTemperature(){
        
        let temperature = self.myWebView.stringByEvaluatingJavaScript(from: "getTemperature()")
        if Bool(temperature!) != false {
            let activityVC = UIActivityViewController(activityItems: [temperature], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }
      
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.url?.host?.hasPrefix("ios") == true{
            shareCurrentTemperature()
            return true
        }
        else{
            return false
        }
    }
    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        if (!webView.isLoading){
//
//            let webViewFrame = webView.frame
//
//            webView.frame = CGRect(x: webViewFrame.origin.x, y: webViewFrame.origin.y, width: webView.scrollView.contentSize.width, height: webView.scrollView.contentSize.height)
//
//            UIGraphicsBeginImageContextWithOptions(webView.scrollView.contentSize, false, 0)
//            webView.layer.render(in: UIGraphicsGetCurrentContext()!)
//            let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//            let imageData = UIImageJPEGRepresentation(image, 0.5)
//            let currentFileName = "screenshot.jpeg"
//            let imageFilePath = fileDirectory[0].appending(currentFileName)
//            let imageFileURL = NSURL(fileURLWithPath: imageFilePath)
//            let imgData = try! imageData?.write(
//                to: imageFileURL as URL,
//                options:Data.WritingOptions.atomicWrite)
//
//            webView.frame = webViewFrame
//
//
//
//        }
//    }
  
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}


