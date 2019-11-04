//
//  TopStoriesInteractor.swift
//  eGym
//
//  Created by Vaibhav Bangde on 01/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

// TopStories Interactor Implementation.
struct TopStoriesInteractor : TopStoriesInteractorProtocol {
    
    let topStoriesFetchService : FetchTopStoriesServiceProtocol
    let createStoryEntityService : CreateStoryEntitiesServiceProtocol
    let fetchImageUrlFromStoryService : FetchImageUrlFromStoryServiceProtocol
    let fetchCellImageService : FetchCellImageServiceProtocol
    
    init(fetchTopStoriesService : FetchTopStoriesServiceProtocol,
         createStoryEntityService: CreateStoryEntitiesServiceProtocol,
         fetchImageUrlFromStory: FetchImageUrlFromStoryServiceProtocol,
         fetchCellImageService : FetchCellImageServiceProtocol) {
        self.topStoriesFetchService = fetchTopStoriesService
        self.createStoryEntityService = createStoryEntityService
        self.fetchImageUrlFromStoryService = fetchImageUrlFromStory
        self.fetchCellImageService = fetchCellImageService
    }
    
    // Fetch Top Stories.
    func fetchTopStories(completion: @escaping ([StoryEntity]?) -> Void) {
        self.topStoriesFetchService.fetchTopStories(completion: { response in
            guard let res = response else {
                completion(nil)
                return
            }
            guard let stories = self.createStoryEntityService.createStoryEntities(from: res) else {
                completion(nil)
                return
            }
            completion(stories)
        })
    }
    
    // Fetch cell Image.
    func fetchCellImage(from story:StoryEntity, completion: @escaping (UIImage?)->Void) {
        guard let imageUrl = self.fetchImageUrlFromStoryService.imageUrl(for: story, with: .thumbnail) else {
            completion(nil)
            return
        }
        self.fetchCellImageService.fetchCellImage(url: imageUrl) { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
}
