//
//  TopStoryTableViewCell.swift
//  eGym
//
//  Created by Vaibhav Bangde on 02/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

class TopStoryTableViewCell: UITableViewCell {

    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        storyImageView.image = nil
    }
    
    func styleSetup() {
        storyImageView.layer.borderWidth = 0.5
        storyImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
