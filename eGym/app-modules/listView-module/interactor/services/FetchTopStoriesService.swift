//
//  FetchTopStoriesService.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct FetchTopStoriesService : ApiProtocol {
    
    var apiService : ApiServiceProtocol?
    
    init(apiService:ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    var path: String {
        return "https://api.nytimes.com/svc/topstories/v2/home.json?"
    }
    
    func getUrl() -> URL? {
        guard let url = URL(string: self.path) else { return nil }
        return url
    }
    
    func getQueryParameters() -> [String : Any]? {
        return ["api-key":"XTLmhYCVbqFX6wD72IBA20sDN9YNDEty"]
    }
    
    func getHTTPHeaders() -> [String : String]? {
        return nil
    }
}

extension FetchTopStoriesService : FetchTopStoriesServiceProtocol {
    func fetchTopStories(completion: @escaping (Data?) -> Void) {
        self.apiService?.get(apiUrl: self.getUrl(),
                             queryParameters: self.getQueryParameters(),
                             headers: self.getHTTPHeaders(),
                             completion: { (response) in
                                guard let responseData = response else {
                                    completion(nil)
                                    return
                                }
                                completion(responseData)
        })
    }
}
