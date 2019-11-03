//
//  fetchCellImageService.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

struct FetchCellImageService : FetchCellImageServiceProtocol {
    let apiService : ApiServiceProtocol?
    
    init(apiService:ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchCellImage(url: URL?, completion: @escaping (UIImage?) -> Void) {
        apiService?.fetchImage(url: url, completion: { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        })
    }
}
