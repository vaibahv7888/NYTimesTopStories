//
//  TopStoriesInteractor.swift
//  eGym
//
//  Created by Vaibhav Bangde on 01/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct TopStoriesInteractor : TopStoriesInteractorProtocol {
    
    let topStoriesFetchService : FetchTopStoriesServiceProtocol
    let createStoryEntityService : CreateStoryEntitiesServiceProtocol
    
    init(fetchTopStoriesService : FetchTopStoriesServiceProtocol, createStoryEntityService: CreateStoryEntitiesServiceProtocol) {
        self.topStoriesFetchService = fetchTopStoriesService
        self.createStoryEntityService = createStoryEntityService
    }
    
    func fetchTopStories(completion: @escaping ([StoryEntity]?) -> Void) {
        self.topStoriesFetchService.fetchTopStories(completion: { response in
            guard let res = response else {
                completion(nil)
                return
            }
            completion(self.createStoryEntityService.createStoryEntities(from: res))
        })
    }
    
}
