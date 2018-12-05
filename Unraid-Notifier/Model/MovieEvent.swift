//
//  Event.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import Foundation

class MovieEvent: Codable {
    let id: Int
    let eventType: String
    let fileID, movieID: Int
    let upgrade: Int?
    let seen: Bool
    let createdAt, updatedAt: String
    let file: File?
    let movie: Movie?

    enum CodingKeys: String, CodingKey {
        case id
        case eventType = "event_type"
        case fileID = "file_id"
        case movieID = "movie_id"
        case upgrade, seen
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case file, movie
    }

    init(id: Int, eventType: String, fileID: Int, movieID: Int, upgrade: Int?, seen: Bool, createdAt: String, updatedAt: String, file: File?, movie: Movie?) {
        self.id = id
        self.eventType = eventType
        self.fileID = fileID
        self.movieID = movieID
        self.upgrade = upgrade
        self.seen = seen
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.file = file
        self.movie = movie
    }
}
