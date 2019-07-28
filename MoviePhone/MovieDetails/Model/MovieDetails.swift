//
//  MovieDetails.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/27/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import Foundation

 struct MovieDetails: Codable {
    let title: String
    let overview: String
    let productionCompanies: [Company]
    let rateAvg: Float
    let rateCount: Int
    let genres: [Genre]
    let runtime: Int
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title", overview, productionCompanies = "production_companies", rateAvg = "voteAverage",
            rateCount = "vote_count", genres, runtime
    }
}

extension MovieDetails {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        overview = try container.decode(String.self, forKey: .overview)
        rateAvg = try container.decode(Float.self, forKey: .rateAvg)
        rateCount = try container.decode(Int.self, forKey: .rateCount)
        runtime = try container.decode(Int.self, forKey: .runtime)
        
        let coContainer = try container.nestedContainer(keyedBy: CoKeys.self, forKey: .productionCompanies)
        productionCompanies = try coContainer.decode(Array.self, forKey: .name)
        
        let genreContainer = try container.nestedContainer(keyedBy: GenreKeys.self, forKey: .genres)
        genres = try genreContainer.decode(Array.self, forKey: .name)
    }
    
    enum CoKeys: CodingKey {
        case name
    }
    
    enum GenreKeys: CodingKey {
        case name
    }
}

struct Company: Codable {
    let name: String
}

struct Genre: Codable {
    let name: String
}

/*
 JSON
 
 {
 "adult": false,
 "backdrop_path": "/1TUg5pO1VZ4B0Q1amk3OlXvlpXV.jpg",
 "belongs_to_collection": null,
 "budget": 260000000,
 "genres": [
 {
 "id": 12,
 "name": "Adventure"
 },
 {
 "id": 16,
 "name": "Animation"
 },
 {
 "id": 10751,
 "name": "Family"
 },
 {
 "id": 18,
 "name": "Drama"
 },
 {
 "id": 28,
 "name": "Action"
 }
 ],
 "homepage": "https://movies.disney.com/the-lion-king-2019",
 "id": 420818,
 "imdb_id": "tt6105098",
 "original_language": "en",
 "original_title": "The Lion King",
 "overview": "Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother—and former heir to the throne—has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his.",
 "popularity": 485.465,
 "poster_path": "/dzBtMocZuJbjLOXvrl4zGYigDzh.jpg",
 "production_companies": [
 {
 "id": 2,
 "logo_path": "/wdrCwmRnLFJhEoH8GSfymY85KHT.png",
 "name": "Walt Disney Pictures",
 "origin_country": "US"
 },
 {
 "id": 7297,
 "logo_path": "/l29JYQVZbTcjZXoz4CUYFpKRmM3.png",
 "name": "Fairview Entertainment",
 "origin_country": ""
 }
 ],
 "production_countries": [
 {
 "iso_3166_1": "US",
 "name": "United States of America"
 }
 ],
 "release_date": "2019-07-12",
 "revenue": 713650600,
 "runtime": 118,
 "spoken_languages": [
 {
 "iso_639_1": "en",
 "name": "English"
 }
 ],
 "status": "Released",
 "tagline": "The King has Returned.",
 "title": "The Lion King",
 "video": false,
 "vote_average": 7.3,
 "vote_count": 941
 }
 */
