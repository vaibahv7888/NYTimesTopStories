//
//  WebPageRouterProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 04/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol WebPageRouterProtocol {
    func createWebPageModule(url:String) -> WebPageViewController
}
