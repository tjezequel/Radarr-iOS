//
//  APIMoviesService.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class APIMoviesService {

    public func getEvents() -> Promise<[MovieEvent]> {
        return Promise { seal in
            request("https://unraid-notifier.herokuapp.com/api/movie/events").validate().responseData(completionHandler: { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        seal.fulfill(try JSONDecoder().decode([MovieEvent].self, from: data))
                    } catch let error {
                        seal.reject(error)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            })
        }
    }

}
