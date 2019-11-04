//
//  FetchImageUrlFromStoryServiceProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

// Common protocol for getting different sized images from a Story object from anywhere in the application.
protocol FetchImageUrlFromStoryServiceProtocol {
    func imageUrl(for story:StoryEntity, with imageFormate:StoryImageFormats) -> URL?
}
