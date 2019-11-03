//
//  TopStoriesRouterProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 31/10/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol TopStoriesRouterProtocol {
    func createTopStoriesModule() -> TopStoriesViewController
    func moveToStoryDetailScreen (story:StoryEntity, navigationController:UINavigationController)
}
