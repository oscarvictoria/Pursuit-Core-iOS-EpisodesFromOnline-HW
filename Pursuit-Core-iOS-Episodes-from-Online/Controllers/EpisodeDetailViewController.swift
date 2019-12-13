//
//  EpisodeDetailViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

var episodeDetailVC: Episodes?
    
@IBOutlet weak var detailEpisodePicture: UIImageView!
@IBOutlet weak var detailEpisodeName: UILabel!
@IBOutlet weak var detailEpisodeSeason: UILabel!
@IBOutlet weak var detailEpisodeDescription: UITextView!
@IBOutlet weak var detailEpisodeNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }

    func updateUI() {
        guard let episodes = episodeDetailVC else {
            fatalError("error")
        }
        let newSummary = episodes.summary?.replacingOccurrences(of: "<p>", with: "")
        detailEpisodeName.text = episodes.name
        detailEpisodeSeason.text = "Season \(episodes.season.description)"
        detailEpisodeDescription.text = newSummary?.replacingOccurrences(of: "</p>", with: "")
        detailEpisodeNumber.text = "Episode \(episodes.number.description)"
        ImageClient.fetchImage(for: episodes.image?.original ?? "") { (result) in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.detailEpisodePicture.image = image
                }
            }
        }
    }
    

}
