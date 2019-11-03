//
//  StoryDetailInteractor.swift
//  eGym
//
//  Created by Vaibhav Bangde on 04/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

struct StoryDetailInteractor : StoryDetailInteractorProtocol {
    
    let apiService : ApiServiceProtocol
    let fetchImageUrlFromStoryService : FetchImageUrlFromStoryServiceProtocol
    
    init(apiService:ApiServiceProtocol, fetchIMageUrlFromStoryService:FetchImageUrlFromStoryServiceProtocol) {
        self.apiService = apiService
        self.fetchImageUrlFromStoryService = fetchIMageUrlFromStoryService
    }
    
    func fetchStoryDetailImage(for story: StoryEntity, completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = self.fetchImageUrlFromStoryService.imageUrl(for: story, with: .mediumThreeByTwo210) else {
            completion(nil)
            return
        }
        self.apiService.fetchImage(url: imageUrl) { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
}
