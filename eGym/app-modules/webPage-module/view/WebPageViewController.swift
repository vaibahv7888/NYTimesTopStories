//
//  WebPageViewController.swift
//  eGym
//
//  Created by Vaibhav Bangde on 04/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit
import WebKit

class WebPageViewController: UIViewController {
    
    var webView: WKWebView!
    var webPagePresenter : WebPagePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadWebPage()
    }
    
    func loadWebPage() {
        guard let presenter = self.webPagePresenter, let url = presenter.webPageUrl() else { return }
        webView.load(URLRequest(url: url))
    }
}

extension WebPageViewController : WKNavigationDelegate {
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
