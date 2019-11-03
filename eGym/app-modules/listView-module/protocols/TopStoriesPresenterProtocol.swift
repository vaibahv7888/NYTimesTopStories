//
//  TopStoriesPresenterProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol TopStoriesPresenterProtocol {
    func fetchTopStories(complition: @escaping (Bool?)->Void)
    func getNumberOfRowsInSection() -> Int
    func storyEntity(For Row:Int) -> StoryEntity?
    func storyImage(for row:StoryEntity, completion: @escaping (UIImage?)->Void)
}
