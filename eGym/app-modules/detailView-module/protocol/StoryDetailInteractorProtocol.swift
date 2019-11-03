//
//  StoryDetailInteractorProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 04/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol StoryDetailInteractorProtocol {
    func fetchStoryDetailImage(for story:StoryEntity, completion:@escaping (UIImage?)->Void)
}
