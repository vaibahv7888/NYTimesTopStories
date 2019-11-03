//
//  CreateStoryEntitiesService.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct CreateStoryEntitiesService : CreateStoryEntitiesServiceProtocol {
    func createStoryEntities(from data: Data?) -> [StoryEntity]? {
        guard let data = data else { return nil }
        
        let responseObject = try! JSONDecoder().decode(TopStoriesEntity.self, from: data)
        
        var topStories : [StoryEntity]
        
        topStories = responseObject.results
        
        return topStories
    }
}
