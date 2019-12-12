//
//  EpisodeAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/11/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct EpisodeAPIClient {
    static func getEpisodes(Id: Int, completion: @escaping (Result <[Episodes], AppError>)-> ()) {
        
        let endpointURL = "http://api.tvmaze.com/shows/\(Id.description)/episodes"
              
              guard let url = URL(string: endpointURL) else {
                  completion(.failure(.badURL(endpointURL)))
                  return
              }
        let request = URLRequest(url: url)
               
               NetworkHelper.shared.performDataTask(with: request) { (result) in
                   switch result {
                   case .failure(let appError):
                       print("app errror \(appError)")
                   case .success(let data):
                       do {
                           let theEpisode = try JSONDecoder().decode([Episodes].self, from: data)
                        let episode = theEpisode
                        completion(.success(episode))
                    

                       } catch {
                           print("decoding error \(error)")
                       }
                   }
               }
           }
    }

