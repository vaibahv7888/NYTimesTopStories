//
//  StoryDetailRouter.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

// Story Detail Router Implementation.
struct StoryDetailRouter : StoryDetailRouterProtocol {
    func createStoryDetailModule(story:StoryEntity) -> StoryDetailViewController {
        let view = AppUtils.mainstoryboard.instantiateViewController(withIdentifier: "StoryDetailViewController") as! StoryDetailViewController
        
        let apiService = ApiService()
        let fetchIMageUrlFromStoryService = FetchImageUrlFromStoryService()
        let storyDetailInteractor = StoryDetailInteractor(apiService: apiService, fetchIMageUrlFromStoryService: fetchIMageUrlFromStoryService)
        let storyDetailPresenter = StoryDetailPresenter(story: story, storyDetailInteractor:storyDetailInteractor, storyDetailRoter : self)
        
        view.storyDetailPresenter = storyDetailPresenter
        
        return view
    }
    
    func showWebPage(for storyUrl:String?, navigationController:UINavigationController) {
        guard let urlString = storyUrl else { return }
        let webPageRouter = WebPageRouter()
        let webPageViewController = webPageRouter.createWebPageModule(url: urlString)
        navigationController.pushViewController(webPageViewController, animated: true)
    }
}
