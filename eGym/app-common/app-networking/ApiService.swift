//
//  ApiService.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import UIKit

// NOTE :
// Underlying Implementation of ApiService can be changed without effecting other parts of the application.
// The current implementation uses native Networking classes such as URLSession, URLComponents, URLQueryItem, etc..
// This can be replaced with third party Libraries like Alamofire or AFNetworking.

struct ApiService {
    
    // Create URLRequest from URL.
    private func createURLRequest(for apiUrl: URL?,
                          method: HTTPMethod = .get,
                          queryParameters: [String: Any]?,
                          httpHeaders: [String: String]?) -> URLRequest? {
        
        guard let url = apiUrl else { return nil }

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        
        if let queryParams = queryParameters {
            var queryItems = [URLQueryItem]()
            for query in queryParams {
                queryItems.append(URLQueryItem(name: query.key, value: query.value as? String))
            }
            
            urlComponents.queryItems = queryItems
        }
        
        guard let finalUrl = urlComponents.url else { return nil }
        
        var request = URLRequest(url: finalUrl)
        
        request.httpMethod = method.rawValue
        
        if let headers = httpHeaders {
            request.allHTTPHeaderFields = headers
        }
        
        return request
    }
    
    // Exicute API call.
    private func exicuteApi (apiUrl:URL?,
                             method: HTTPMethod = .get,
                             queryParameters: [String: Any]?,
                             httpHeaders: [String: String]?,
                             completion: @escaping (_ response:Data?) ->Void
        ) {
        
        guard let request = self.createURLRequest(for: apiUrl, queryParameters: queryParameters, httpHeaders: httpHeaders) else {
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: {(data : Data?, response : URLResponse?, error : Error?) in
            
            if let error = error {
                print(error)
                return
            }

            guard let _ = response else { return }
            guard let data = data else { return }

            completion(data)
            }
        )
        dataTask.resume()
    }
}

// MARK: - ApiServiceProtoCol Implementation
// Note : APIServiceProtocol is the abstraction layer for rest of the project to access Networking services.
//API service protocol implementaion.
extension ApiService : ApiServiceProtocol {
    // Get Method Implementation.
   func get(apiUrl: URL?, queryParameters: [String : Any]?, headers: [String : String]?, completion: @escaping CompletionHandler) {
       self.exicuteApi(apiUrl: apiUrl,
                       method: .get,
                       queryParameters: queryParameters,
                       httpHeaders: headers,
                       completion: { response in
           if let responseData = response {
               completion(responseData)
               return
           }
           completion(nil)
           })
   }
   
    //Post Method Implementation.
   func post(apiUrl: URL?, queryParameters: [String : String]?, headers: [String : String]?, completion: @escaping CompletionHandler) {
               self.exicuteApi(apiUrl: apiUrl,
                       method: .post,
                       queryParameters: queryParameters,
                       httpHeaders: headers,
                       completion: { response in
           if let responseData = response {
               completion(responseData)
               return
           }
           completion(nil)
           })

   }
    
    //Fetch Image Implementation.
    func fetchImage(url:URL?, completion: @escaping (UIImage?)->Void) {
        self.get(apiUrl: url, queryParameters: nil, headers: nil) { (imageData) in
            guard let data = imageData, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
}
