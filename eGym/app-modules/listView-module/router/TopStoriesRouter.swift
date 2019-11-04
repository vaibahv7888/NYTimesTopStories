//
//  TopStoriesRouter.swift
//  eGym
//
//  Created by Vaibhav Bangde on 31/10/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

// Top Stories Router Implementation.
struct TopStoriesRouter : TopStoriesRouterProtocol {
    func createTopStoriesModule() -> TopStoriesViewController {
        let view = AppUtils.mainstoryboard.instantiateViewController(withIdentifier: "TopStoriesViewController") as! TopStoriesViewController
        
        let apiService = ApiService()
        let fetchTopStoriesService = FetchTopStoriesService(apiService: apiService)
        let createStoryEntityService = CreateStoryEntitiesService()
        let fetchImageUrlFromStory = FetchImageUrlFromStoryService()
        let fetchCellImageService = FetchCellImageService(apiService: apiService)
        let topStoriesInteractor = TopStoriesInteractor(fetchTopStoriesService: fetchTopStoriesService,
                                                        createStoryEntityService: createStoryEntityService,
                                                        fetchImageUrlFromStory: fetchImageUrlFromStory,
                                                        fetchCellImageService : fetchCellImageService)
        let topStoriesPresentor = TopStoriesPresenter(topStoriesInteractor: topStoriesInteractor, topStoriesRouter: self)
        
        view.topStoriesPresenter = topStoriesPresentor
        
        return view
    }
    
    func moveToStoryDetailScreen(story:StoryEntity, navigationController:UINavigationController) {
        let storyDetailRouter = StoryDetailRouter()
        let storyDetailViewController = storyDetailRouter.createStoryDetailModule(story: story)
        navigationController.pushViewController(storyDetailViewController, animated: true)
    }
}
