//
//  TopStoriesInteractorProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 01/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol TopStoriesInteractorProtocol {
    func fetchTopStories(completion: @escaping ([StoryEntity]?)->Void)
    func fetchCellImage(from story:StoryEntity, completion: @escaping (UIImage?)->Void)
}
