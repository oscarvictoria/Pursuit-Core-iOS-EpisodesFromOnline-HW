//
//  EpisodeCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
@IBOutlet weak var episodePicture: UIImageView!
@IBOutlet weak var episodeName: UILabel!
@IBOutlet weak var episodeSeason: UILabel!
    
    func updateCell(for episode: Episodes) {
        episodeSeason.text = "Episode: \(episode.name)"
        episodeName.text = "Season: \(episode.season.description)"
        ImageClient.fetchImage(for: episode.image?.original ?? "") { (result) in
            switch result {
            case .failure(let appError):
                print("error: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.episodePicture.image = image
                }
            }
        }
    }
    
}



