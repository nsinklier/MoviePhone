//
//  Movie.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/23/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import Foundation

public struct Movie: Codable {
    let title: String
    let id: Int
    let rating: Int
    let imagePath: String
    let genreIDs: Array<Int>
    let releaseDate: String
}

extension Movie {
    struct CodingData: Codable {
        struct Attributes: Codable {
            var title: String
            var id: Int
            var voteAverage: Int
            var posterPath: String
            var genreIDs: Array<Int>
            var releaseDate: String
        }
        var movieData: Attributes
    }
}

extension Movie.CodingData {
    var movie: Movie {
        return Movie(
            title: movieData.title,
            id: movieData.id,
            rating: movieData.voteAverage,
            imagePath: movieData.posterPath,
            genreIDs: movieData.genreIDs,
            releaseDate: movieData.releaseDate)
    }
}

//{
//    "genres": [
//    {
//    "id": 28,
//    "name": "Action"
//    },
//    {
//    "id": 12,
//    "name": "Adventure"
//    },
//    {
//    "id": 16,
//    "name": "Animation"
//    },
//    {
//    "id": 35,
//    "name": "Comedy"
//    },
//    {
//    "id": 80,
//    "name": "Crime"
//    },
//    {
//    "id": 99,
//    "name": "Documentary"
//    },
//    {
//    "id": 18,
//    "name": "Drama"
//    },
//    {
//    "id": 10751,
//    "name": "Family"
//    },
//    {
//    "id": 14,
//    "name": "Fantasy"
//    },
//    {
//    "id": 36,
//    "name": "History"
//    },
//    {
//    "id": 27,
//    "name": "Horror"
//    },
//    {
//    "id": 10402,
//    "name": "Music"
//    },
//    {
//    "id": 9648,
//    "name": "Mystery"
//    },
//    {
//    "id": 10749,
//    "name": "Romance"
//    },
//    {
//    "id": 878,
//    "name": "Science Fiction"
//    },
//    {
//    "id": 10770,
//    "name": "TV Movie"
//    },
//    {
//    "id": 53,
//    "name": "Thriller"
//    },
//    {
//    "id": 10752,
//    "name": "War"
//    },
//    {
//    "id": 37,
//    "name": "Western"
//    }
//    ]
//}
