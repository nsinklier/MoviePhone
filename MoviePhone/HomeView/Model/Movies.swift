//
//  Movie.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/23/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import Foundation

public struct Movies: Codable {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page, totalPages = "total_pages", movies = "results"
    }
}

public struct Movie: Codable {
    let title: String
    let id: Int
    let image: String
    let genres: Array<Int>
    
    enum CodingKeys: String, CodingKey {
        case title, id, image = "poster_path", genres = "genre_ids"
    }
}

//extension Movie.CodingData {
//    var movie: Movie {
//        return Movie(
//            title: movieData.title,
//            id: movieData.id,
//            posterPath: movieData.posterPath,
//            genreIds: movieData.genreIDs)
//    }
//}

/*
 JSON example:
 
 Data: {
     dates =     {
        maximum = "2019-08-01";
        minimum = "2019-06-14";
     };
     page = 1;              ****** Movies.page ******
     results =     (        ****** Movies.data ******
         {
             adult = 0;
             "backdrop_path" = "/1TUg5pO1VZ4B0Q1amk3OlXvlpXV.jpg";
             "genre_ids" =             (
                 12,
                 16,
                 10751,
                 18,
                 28
            );
             id = 420818;
             "original_language" = en;
             "original_title" = "The Lion King";
             overview = "Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother\U2014and former heir to the throne\U2014has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his.";
             popularity = "485.465";
             "poster_path" = "/dzBtMocZuJbjLOXvrl4zGYigDzh.jpg";
             "release_date" = "2019-07-12";
             title = "The Lion King";
             video = 0;
             "vote_average" = "7.2";
             "vote_count" = 921;
         },
         {
             adult = 0;
             "backdrop_path" = "/dihW2yTsvQlust7mSuAqJDtqW7k.jpg";
             "genre_ids" =             (
                 28,
                 12,
                 878
            );
             id = 429617;
             "original_language" = en;
             "original_title" = "Spider-Man: Far from Home";
             overview = "Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.";
             popularity = "234.125";
             "poster_path" = "/rjbNpRMoVvqHmhmksbokcyCr7wn.jpg";
             "release_date" = "2019-06-28";
             title = "Spider-Man: Far from Home";
             video = 0;
             "vote_average" = "7.8";
             "vote_count" = 2417;
         },
    ...
    );
    "total_pages" = 47;         ****** Movies.totalPages ******
    "total_results" = 928;
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
 */
