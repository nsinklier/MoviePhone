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
    private var page = 1
    
    init(services: MovieServices) {
        movieServices = services
        super.init()
    }
    
    func populateData() {
        fetchMovies(page: 1)
    }
    
    func fetchAdditionalData() {
        page += 1
        fetchMovies(page: page)
    }
    
    func fetchMovies(page: Int) {
        movieServices.nowPlaying(page: page, completion: { result in
            switch result {
            case .success(let data):
                do {
                    //                    let movies = try JSONDecoder().decode([Movie].self, from: data)
                    
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
