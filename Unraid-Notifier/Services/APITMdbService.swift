//
//  APITMdbService.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

enum TMDBErrors: Error {
    case noPoster
}

class APITMdbService {

    var apiKey = "6c6870f4eb585b62fffb4439032da744"
    var lang = Locale.current.languageCode

    private func moviePosterURL(id: String) -> Promise<String> {
        return Promise { promise in
            let parameters: Parameters = [
                "api_key": apiKey,
                "language": lang!
            ]
            request("https://api.themoviedb.org/3/movie/\(id)/images", method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).validate().responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let image = try JSONDecoder().decode(TMDBImage.self, from: data)
                        guard let posters = image.posters,
                            posters.count > 0 else {
                            promise.reject(TMDBErrors.noPoster)
                            return
                        }
                        promise.fulfill("https://image.tmdb.org/t/p/w300\(posters.first!.filePath)")
                    } catch let error {
                        promise.reject(error)
                    }
                case .failure(let error):
                    promise.reject(error)
                }
            }
        }
    }

    public func posterFor(id: String) -> Promise<UIImage> {
        return moviePosterURL(id: id)
        .then { url in
            request(url).validate().responseData()
        }.then { arg -> Promise<UIImage> in
            let image = UIImage(data: arg.data)
            return Promise { seal in
                seal.fulfill(image!)
            }
        }
    }

}
