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
    private var currentPage = 1
    var movies: Movies?
    
    init(services: MovieServices) {
        movieServices = services
        super.init()
    }
    
    func populateData() {
        currentPage = 1
        fetchMovies(page: currentPage)
    }
    
    func fetchAdditionalData() -> Bool {
        guard currentPage < movies?.totalPages ?? 0 else { return false }
            
        currentPage += 1
        fetchMovies(page: currentPage)
        return true
    }
    
    func fetchMovies(page: Int) {
        movieServices.nowPlaying(page: page, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                do {
                    self.movies = try? JSONDecoder().decode(Movies.self, from: data)
                    print("Model = \(String(describing: self.movies))")
                    
                    // remove
                    let testMovies = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print("Data: \(String(describing: testMovies))")
                } catch {
                    print("JSON decoding error")
                }
                
            case .failure(let error):
                print("\(error)")
            }
        })
    }

}
