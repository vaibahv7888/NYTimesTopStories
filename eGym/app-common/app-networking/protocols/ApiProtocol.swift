//
//  ApiProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import  Foundation

protocol ApiProtocol {
    var path : String {get}
    func getUrl() -> URL?
    func getQueryParameters() -> [String:Any]?
    func getHTTPHeaders() -> [String:String]?
}


public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
