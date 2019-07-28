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
    private let moviesDataSource: MoviesDataSource
    var movies: Movies?
    
    init(services: MovieServices, dataSource: MoviesDataSource) {
        movieServices = services
        moviesDataSource = dataSource
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
                    
                    var movieCellData = [MovieCellData]()
                    print("Page: \(movies.page) of \(movies.totalPages)")
                    for movie in movies.movies {
                        print("Title: \(movie.title)")
                        print("\tID: \(movie.id)")
                        print("\tGenres: \(movie.genres)")
                        print("\tImagePath: \(movie.image)")
                        
                        guard let url = URLFactory().movieImage(imagePath: movie.image) else { return }
                        self.fetchImage(url: url, completion: { [weak self] image in
                            guard let self = self else { return }
                            movieCellData.append(MovieCellData(title: movie.title, image: image))
                            self.moviesDataSource.movieData.append(contentsOf: movieCellData)
                        })
                    }
                
                    // uncomment below lines for debugging
//                    let rawJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                    print("Data: \(String(describing: rawJSON))"
            case .failure(let error):
                print("\(error)")
            }
        })
    }
    
    // Add an imageCache <String: UIImage> instead of using a block here
    // Move out to another ImageCache class
    func fetchImage(url: URL, completion: @escaping (_ image: UIImage) -> Void) {
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
        }
    }
}

struct MovieCellData {
    let title: String
    let image: UIImage?
}
