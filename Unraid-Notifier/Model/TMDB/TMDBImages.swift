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
    let backdrops: [JSONAny]?
    let posters: [Poster]?

    init(id: Int?, backdrops: [JSONAny]?, posters: [Poster]?) {
        self.id = id
        self.backdrops = backdrops
        self.posters = posters
    }
}
