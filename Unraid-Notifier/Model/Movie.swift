//
//  Movie.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import Foundation

class Movie: Codable {
    let title, tmdbID: String
    let releaseYear: Int
    let files: [File]?
    let events: [MovieEvent]?

    enum CodingKeys: String, CodingKey {
        case title
        case releaseYear = "release_year"
        case tmdbID = "tmdb_id"
        case files, events
    }

    init(title: String, releaseYear: Int, tmdbID: String, files: [File]?, events: [MovieEvent]?) {
        self.title = title
        self.releaseYear = releaseYear
        self.tmdbID = tmdbID
        self.files = files
        self.events = events
    }
}
