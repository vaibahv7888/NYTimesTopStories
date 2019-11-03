//
//  TopStoriesEntity.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct TopStoriesEntity : Codable {
    let status : String
    let copyright : String
    let section : String
    let last_updated : String
    let num_results : Int
    let results : [StoryEntity]
    
    enum CodingKeys : CodingKey {
        case status
        case copyright
        case section
        case last_updated
        case num_results
        case results
    }
}
