//
//  StoryEntity.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct StoryEntity : Codable {
    let section : String
    let subsection : String
    let title : String
    let url : String
    let byline : String
    let short_url : String
    let multimedia : [MultimediaEntity]
    
    enum CodingKeys : CodingKey {
        case section
        case subsection
        case title
        case url
        case byline
        case short_url
        case multimedia
    }

}
