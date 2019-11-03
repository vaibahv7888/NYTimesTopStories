//
//  AppUtils.swift
//  eGym
//
//  Created by Vaibhav Bangde on 01/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum StoryImageFormats : String {
    case thumbnail              = "Standard Thumbnail"
    case largeThumbnail         = "thumbLarge"
    case normal                 = "Normal"
    case mediumThreeByTwo210    = "mediumThreeByTwo210"
    case superJumbo             = "superJumbo"
}
