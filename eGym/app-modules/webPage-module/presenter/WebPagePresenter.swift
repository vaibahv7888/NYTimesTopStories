//
//  WebPagePresenter.swift
//  eGym
//
//  Created by Vaibhav Bangde on 04/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

// Web Page Presenter Implementation.
struct WebPagePresenter : WebPagePresenterProtocol {
    
    var urlString : String
    
    init(urlString:String) {
        self.urlString = urlString
    }
    
    func webPageUrl() -> URL? {
        return URL(string: self.urlString)
    }
}
