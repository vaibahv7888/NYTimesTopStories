//
//  StoryDetailPresenter.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

// Story Detail Presenter Implementation.
struct StoryDetailPresenter : StoryDetailPresenterProtocol {
    
    var story : StoryEntity
    let storyDetailInteractor : StoryDetailInteractorProtocol
    let storyDetailRoter : StoryDetailRouterProtocol
    
    init(story:StoryEntity, storyDetailInteractor:StoryDetailInteractorProtocol, storyDetailRoter : StoryDetailRouterProtocol) {
        self.story = story
        self.storyDetailInteractor = storyDetailInteractor
        self.storyDetailRoter = storyDetailRoter
    }
    
    func fetchStoryDetailImage(completion: @escaping (UIImage?) -> Void) {
        self.storyDetailInteractor.fetchStoryDetailImage(for: self.story) { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
    
    func storyDetailNavigationTitle() -> String? {
        return story.section
    }
    
    func storyTitle() -> String? {
        return story.title
    }
    
    func storyDescription() -> String? {
        return story.abstract
    }
    
    func storyAuthor() -> String? {
        return story.byline
    }
    
    func showWebPage(navigationController:UINavigationController) {
        self.storyDetailRoter.showWebPage(for: story.short_url, navigationController: navigationController)
    }
}
