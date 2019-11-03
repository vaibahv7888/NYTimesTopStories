//
//  TopStoriesInteractorProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 01/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol TopStoriesInteractorProtocol {
    func fetchTopStories(completion: @escaping ([StoryEntity]?)->Void)
}
