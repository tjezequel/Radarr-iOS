//
//  TMDBPoster.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import Foundation

class TMDBPoster: Codable {
    let aspectRatio: Double
    let filePath: String
    let height: Int
    let iso639_1: String
    let voteAverage: Double
    let voteCount, width: Int

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
        case height
        case iso639_1 = "iso_639_1"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }

    init(aspectRatio: Double, filePath: String, height: Int, iso639_1: String, voteAverage: Double, voteCount: Int, width: Int) {
        self.aspectRatio = aspectRatio
        self.filePath = filePath
        self.height = height
        self.iso639_1 = iso639_1
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.width = width
    }
}
