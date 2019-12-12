//
//  Shows.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Oscar Victoria Gonzalez  on 12/10/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Shows: Decodable {
    let show: Show?
}

struct Show: Decodable {
    let id: Int
    let name: String
    let rating: Rating?
    let image: theImage?
}
struct theImage: Decodable {
    let medium: String
    let original: String
}


struct Rating: Decodable {
    let average: Double?
}

