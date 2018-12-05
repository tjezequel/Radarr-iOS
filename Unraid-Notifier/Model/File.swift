//
//  File.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import Foundation

class File: Codable {
    let id, movieID: Int
    let releaseName, tracker, name: String?
    let size: Double?
    let quality, createdAt: String
    let updatedAt: String
    let movie: Movie?

    enum CodingKeys: String, CodingKey {
        case id
        case movieID = "movie_id"
        case releaseName = "release_name"
        case size, name, tracker, quality
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case movie
    }

    init(id: Int, movieID: Int, releaseName: String?, size: Double?, name: String, tracker: String?, quality: String, createdAt: String, updatedAt: String, movie: Movie?) {
        self.id = id
        self.movieID = movieID
        self.releaseName = releaseName
        self.size = size
        self.name = name
        self.tracker = tracker
        self.quality = quality
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.movie = movie
    }
}
