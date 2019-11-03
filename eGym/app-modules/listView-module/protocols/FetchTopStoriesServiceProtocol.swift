//
//  FetchTopStoriesServiceProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol FetchTopStoriesServiceProtocol {
    func fetchTopStories(completion: @escaping (Data?)->Void)
}
