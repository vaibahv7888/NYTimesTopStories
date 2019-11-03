//
//  TopStoriesViewController.swift
//  eGym
//
//  Created by Vaibhav Bangde on 31/10/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

class TopStoriesViewController: UIViewController {
    
    @IBOutlet weak var topStoryTableView: UITableView!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    var topStoriesPresenter:TopStoriesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Top Stories"
        
        self.topStoryTableView.rowHeight = UITableView.automaticDimension
        self.topStoryTableView.estimatedRowHeight = 600
        
        self.activitiIndicator.isHidden = false
        self.activitiIndicator.startAnimating()
        
        self.topStoriesPresenter?.fetchTopStories(complition: { (response) in
            guard let isSuccess = response else { return }
            DispatchQueue.main.async {
                if isSuccess {
                    self.topStoryTableView.reloadData()
                    self.activitiIndicator.stopAnimating()
                    self.activitiIndicator.isHidden = true
                }
            }
        })
    }
}

extension TopStoriesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.topStoriesPresenter?.getNumberOfRowsInSection() else { return 1 }
        print(count)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopStoryTableViewCell") as? TopStoryTableViewCell else {
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        
        if let presenter = self.topStoriesPresenter, let story = presenter.storyEntity(For: indexPath.row) {
            cell.storyTitle.text = story.title
            cell.storyAuthor.text = story.byline
            presenter.storyImage(for: story, completion: { (response) in
                guard let image = response else { return }
                DispatchQueue.main.async {
                    cell.storyImageView.image = image
                }
            })
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navController = navigationController else { return }
        guard let presenter = self.topStoriesPresenter, let story = presenter.storyEntity(For: indexPath.row)  else { return }
        presenter.moveToStoryDetailScreen(story: story, navigationController: navController)
    }
}
