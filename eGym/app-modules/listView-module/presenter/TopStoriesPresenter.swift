//
//  TopStoriesPresenter.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import UIKit

class TopStoriesPresenter : TopStoriesPresenterProtocol {
    
    let topStoriesInteractor : TopStoriesInteractorProtocol
    
    var topStories : [StoryEntity]?
    
    init(topStoriesInteractor : TopStoriesInteractorProtocol) {
        self.topStoriesInteractor = topStoriesInteractor
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
    
    func storyImage(for row:Int) -> UIImage? {
        return nil
    }
}
