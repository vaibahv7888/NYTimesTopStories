//
//  ApiService.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct ApiService : ApiServiceProtocol {
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

    private func exicuteApi (apiUrl:URL?,
                             method: HTTPMethod = .get,
                             queryParameters: [String: Any]?,
                             httpHeaders: [String: String]?,
                             completion: @escaping (_ response:Data?) ->Void
        ) {
        guard let url = apiUrl else {
            completion(nil)
            return
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(nil)
            return
        }
        
        if let queryParams = queryParameters {
            var queryItems = [URLQueryItem]()
            for query in queryParams {
                queryItems.append(URLQueryItem(name: query.key, value: query.value as? String))
            }
            
            urlComponents.queryItems = queryItems
        }
        
        guard let finalUrl = urlComponents.url else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: finalUrl)
        
        request.httpMethod = method.rawValue
        
        if let headers = httpHeaders {
            request.allHTTPHeaderFields = headers
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
