//
//  TopStoriesPresenter.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import UIKit

// TopStories Presenter Implementation.
class TopStoriesPresenter : TopStoriesPresenterProtocol {
    
    let topStoriesInteractor : TopStoriesInteractorProtocol
    let topStoriesRouter : TopStoriesRouterProtocol
    
    var topStories : [StoryEntity]?
    
    init(topStoriesInteractor : TopStoriesInteractorProtocol,
         topStoriesRouter : TopStoriesRouterProtocol) {
        self.topStoriesInteractor = topStoriesInteractor
        self.topStoriesRouter = topStoriesRouter
    }

    func fetchTopStories(complition: @escaping (Bool?) -> Void) {
        self.topStoriesInteractor.fetchTopStories(completion: { response in
            guard let res = response else {
                complition(false)
                return
            }
            self.topStories = res
            complition(true)
        })
    }
    
    func getNumberOfRowsInSection() -> Int {
        guard let stories = topStories else { return 0 }
        return stories.count
    }
    
    func storyEntity(For Row: Int) -> StoryEntity? {
        guard let stories = topStories else { return nil }
        
        return stories[Row]
    }
    
    func storyImage(for story:StoryEntity, completion: @escaping (UIImage?)->Void) {
        self.topStoriesInteractor.fetchCellImage(from: story) { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
    
    func moveToStoryDetailScreen(story: StoryEntity, navigationController: UINavigationController) {
        self.topStoriesRouter.moveToStoryDetailScreen(story: story, navigationController: navigationController)
    }
}
