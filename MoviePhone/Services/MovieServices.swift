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
            fetchData(url: url, completion: completion)
        } else {
            print("Invalid URL Error")
        }
    }
    
    func movieDetails(id: Int, completion: @escaping completion) {
        if let url = urlFactory.movieDetails(id: id) {
            fetchData(url: url, completion: completion)
        } else {
            print("Invalid URL Error")
        }
    }
    
    private func fetchData(url: URL, completion: @escaping completion) {
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
    }
}

