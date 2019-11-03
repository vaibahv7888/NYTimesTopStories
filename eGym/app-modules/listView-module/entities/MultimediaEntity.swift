//
//  MultimediaEntity.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct MultimediaEntity : Codable {
    let url : String
    let format : String
    let height : Int
    let width : Int
    let type : String
    let subtype : String
    let caption : String
    let copyright : String
    
    enum CodingKeys : CodingKey {
        case url
        case format
        case height
        case width
        case type
        case subtype
        case caption
        case copyright
    }
}
