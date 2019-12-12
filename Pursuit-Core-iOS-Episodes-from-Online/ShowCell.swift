//
//  ShowCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/11/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {

@IBOutlet weak var imageCell: UIImageView!
@IBOutlet weak var titleCell: UILabel!
@IBOutlet weak var ratingCell: UILabel!
    
    
    func configured(for show: Shows) {
        titleCell.text = "Title - \(show.show?.name ?? "")"
        ratingCell.text = "Rating \(show.show?.rating?.average?.description ?? "")"
        ImageClient.fetchImage(for: show.show?.image?.medium ?? "") { (result) in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageCell.image = image
                }
            }
        }
    }
}
