//
//  MovieServices.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/23/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import UIKit

//enum Result<Value, Error: Swift.Error> {
//    case success(Value)
//    case failure(Error)
//}

//enum ServiceError: Error {
//    case networkingError
//    case decodingError
//}

typealias completion = (Result<Data, Error>) -> Void


class MovieServices: NSObject {
    private let urlFactory: URLFactory
    
    init(urlFactory: URLFactory) {
        self.urlFactory = urlFactory
        super.init()
    }
        
    func nowPlaying(page: Int, completion: @escaping completion) {
        if let url = urlFactory.nowPlayingURL(page: page) {
            
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard let data = data, error == nil else {
                    if let error = error {
                        print("\(error)")
                        completion(.failure(error))
                    }
                    return
                }
                completion(.success(data))
            }.resume()
        } else {
            print("URL error")
        }
    }
}



// URL: https://api.themoviedb.org/3/movie/now_playing?api_key=789a3ad9fb130b33628be0e27eaf57c8&language=en-US

// https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2014-09-15&primary_release_date.lte=2014-10-22&page=1&api_key=64b6f3a69e5717b13ed8a56fe4417e71

// _url : http://api.themoviedb.org/3/discover/movie?api_key=57a4269b6c0098d52f01d65572e57972&sort_by=popularity.desc
