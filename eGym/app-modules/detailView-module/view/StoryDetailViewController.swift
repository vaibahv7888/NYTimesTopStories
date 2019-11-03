//
//  StoryDetailViewController.swift
//  eGym
//
//  Created by Vaibhav Bangde on 03/11/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController {

    @IBOutlet weak var detailViewImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    var storyDetailPresenter : StoryDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.activitiIndicator.isHidden = false
        self.activitiIndicator.startAnimating()
        
        self.navigationItem.title = self.storyDetailPresenter?.storyDetailNavigationTitle()
        
        self.setUpStoryDetailView()
    }
    
    func setUpStoryDetailView() {
        guard let presenter = self.storyDetailPresenter else { return }
        self.titleLbl.text = presenter.storyTitle()
        self.descriptionLbl.text = presenter.storyDescription()
        self.authorLbl.text = presenter.storyAuthor()
        
        presenter.fetchStoryDetailImage { (response) in
            guard let image = response else { return }
            DispatchQueue.main.async {
                self.activitiIndicator.startAnimating()
                self.activitiIndicator.isHidden = true
                self.detailViewImage.image = image
            }
        }
    }
    
    
    @IBAction func seeMoreClicked(_ sender: Any) {
        guard let navController = navigationController, let presenter = self.storyDetailPresenter else { return }
        presenter.showWebPage(navigationController: navController)
    }
}
