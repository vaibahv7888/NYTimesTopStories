//
//  ApiProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import  Foundation

// API format protocol.
protocol ApiProtocol {
    var path : String {get}
    func getUrl() -> URL?
    func getQueryParameters() -> [String:Any]?
    func getHTTPHeaders() -> [String:String]?
}
