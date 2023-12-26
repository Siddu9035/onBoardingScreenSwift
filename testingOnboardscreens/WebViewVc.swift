//
//  WebViewVc.swift
//  testingOnboardscreens
//
//  Created by siddappa tambakad on 15/12/23.
//

import UIKit
import WebKit

class WebViewVc: UIViewController, WKNavigationDelegate {
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        activityIndicator.startAnimating()
        
//        webView.load(URLRequest(url: URL(string: "https://www.dollarbirdinc.com/")!))
        let myUrl = URL(string: "https://staging.pennymead.com/")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}
