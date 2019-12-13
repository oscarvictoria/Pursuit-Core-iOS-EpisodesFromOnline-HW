//
//  Episodes.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Episodes: Decodable {
    let name: String
    let season: Int
    let number: Int
    let image: Image?
    let summary: String?
}

struct Image: Decodable {
    let medium: String?
    let original: String?
}
