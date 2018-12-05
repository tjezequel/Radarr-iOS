//
//  TMDBImagesRequest.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import Foundation

class TMDBImage: Codable {
    let id: Int?
    let posters: [TMDBPoster]?

    init(id: Int?, posters: [TMDBPoster]?) {
        self.id = id
        self.posters = posters
    }
}
