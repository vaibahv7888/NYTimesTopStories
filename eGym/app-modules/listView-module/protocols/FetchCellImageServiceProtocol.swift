//
//  fetchCellImageServiceProtocol.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol FetchCellImageServiceProtocol {
    func fetchCellImage(url:URL?, completion:@escaping (UIImage?)->Void)
}
