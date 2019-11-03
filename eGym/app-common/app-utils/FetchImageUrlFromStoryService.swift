//
//  FetchImageUrlFromStoryService.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct FetchImageUrlFromStoryService : FetchImageUrlFromStoryServiceProtocol {
    func imageUrl(for story: StoryEntity, with imageFormate: StoryImageFormats) -> URL? {
        guard let urlStr = story.multimedia.first (where: { $0.format == imageFormate.rawValue})?.url else { return nil }
        guard let url = URL(string: urlStr) else { return nil }
        return url
    }
}
