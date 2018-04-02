//
//  Achievement.swift
//  achievements
//
//  Created by jhonathan on 3/31/18.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation

struct Achievement: Codable {
    let achievements: [Achievements]
}

struct Achievements: Codable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let imageUrl: String
    let accessible: Bool
    
    enum CodingKeys: String,CodingKey {
        case id
        case level
        case progress
        case total
        case imageUrl = "bg_image_url"
        case accessible
    }
}
