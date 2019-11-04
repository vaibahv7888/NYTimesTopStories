//
//  ApiServiceProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

typealias CompletionHandler = (_ response:Data?) ->Void

// API service abstraction protocol.
protocol ApiServiceProtocol {
    func get(apiUrl: URL?,
             queryParameters: [String:Any]?,
             headers: [String:String]?,
             completion: @escaping CompletionHandler)
    
    func post(apiUrl: URL?,
              queryParameters: [String:String]?,
              headers: [String:String]?,
              completion: @escaping CompletionHandler)
    
    func fetchImage(url:URL?,
                    completion: @escaping (UIImage?)->Void)
}
