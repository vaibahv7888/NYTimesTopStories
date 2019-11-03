//
//  WebPageRouter.swift
//  eGym
//
//  Created by Vaibhav Bangde on 04/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct WebPageRouter : WebPageRouterProtocol {
    func createWebPageModule(url: String) -> WebPageViewController {
        let view = AppUtils.mainstoryboard.instantiateViewController(withIdentifier: "WebPageViewController") as! WebPageViewController
        
        let presenter = WebPagePresenter(urlString: url)
        
        view.webPagePresenter = presenter
        
        return view
    }
}
