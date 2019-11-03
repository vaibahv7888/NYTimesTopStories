//
//  StoryDetailPresenterProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol StoryDetailPresenterProtocol {
    func fetchStoryDetailImage(completion: @escaping(UIImage?)->Void)
    func storyDetailNavigationTitle() -> String?
    func storyTitle() -> String?
    func storyDescription() -> String?
    func storyAuthor() -> String?
    func showWebPage(navigationController:UINavigationController)
}
