//
//  ShowsAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowsAPIClient {
    static func getShows(searchQuery: String, completion: @escaping (Result <[Shows], AppError>)-> ()) {
        
        let endpointURL = "https://api.tvmaze.com/search/shows?q=\(searchQuery)"
        
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
                    let theShows = try JSONDecoder().decode([Shows].self, from: data)
                    let someShow = theShows
                    completion(.success(someShow))

                } catch {
                    print("decoding error \(error)")
                }
            }
        }
    }
}
