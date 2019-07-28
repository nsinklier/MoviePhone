//
//  MovieHomeViewModel.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/27/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import UIKit

class MovieHomeViewModel: NSObject {
    private let movieServices: MovieServices
    var movies: Movies?
    
    init(services: MovieServices) {
        movieServices = services
        super.init()
    }
    
    func populateData() {
        fetchMovies(page: 1)
    }
    
    func fetchAdditionalData() -> Bool {
        guard let movies = movies, movies.page < movies.totalPages else { return false }
        
        fetchMovies(page: movies.page + 1)
        return true
    }
    
    func fetchMovies(page: Int) {
        movieServices.nowPlaying(page: page, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                    self.movies = try? JSONDecoder().decode(Movies.self, from: data)
                    guard let movies = self.movies else {
                        print("JSON decoding error")
                        return
                    }
                    
                    print("Page: \(movies.page) of \(movies.totalPages)")
                    for movie in movies.movies {
                        print("Title: \(movie.title)")
                        print("\tID: \(movie.id)")
                        print("\tGenres: \(movie.genres)")
                        print("\tImagePath: \(movie.image)")
                    }
                    // uncomment below lines for debugging
//                    let rawJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                    print("Data: \(String(describing: rawJSON))"
            case .failure(let error):
                print("\(error)")
            }
        })
    }

}
