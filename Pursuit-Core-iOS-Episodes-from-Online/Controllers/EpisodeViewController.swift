//
//  EpisodeViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var theEpisode: Episodes?
    
    var theEpisodes: Shows?
    
    
    
    var episodes = [Episodes]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        updateUI()
    }
    

    
    func updateUI() {
        guard let programs = theEpisodes else {
            fatalError("error")
        }
        EpisodeAPIClient.getEpisodes(Id: programs.show?.id ?? 13) { (result) in
            switch result {
            case .failure(let error):
                print("error \(error)")
            case .success(let episode):
                self.episodes = episode
            }
        }
    }

    
}

extension EpisodeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
        let someEpisodes = episodes[indexPath.row]
        cell.textLabel?.text = someEpisodes.name
        print(episodes.count)
        return cell
    }
}

