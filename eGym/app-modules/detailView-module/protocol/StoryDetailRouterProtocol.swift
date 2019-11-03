//
//  StoryDetailRouterProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol StoryDetailRouterProtocol {
    func createStoryDetailModule(story:StoryEntity) -> StoryDetailViewController
    func showWebPage(for storyUrl:String?, navigationController:UINavigationController)
}
