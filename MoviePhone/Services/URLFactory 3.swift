//
//  URLFactory.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/27/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import Foundation

struct URLFactory {
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    private let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    
    private let nowPlaying = "now_playing"
    
    private let apiKey = "api_key=789a3ad9fb130b33628be0e27eaf57c8"
    private let language = "language=en-US"
    private let popularOrder = "sort_by=popularity.desc"
    
    
    func nowPlayingURL(page: Int) -> URL? {
        return URL(string: baseURL + nowPlaying + "?" + apiKey + "&" + language + "&" + popularOrder + "&" + "page=\(page)")
    }
    
    func movieDetails(id: Int) -> URL? {
        return URL(string: baseURL + String(id) + "?" + apiKey + language)
    }
}


/*
 Now Playing URL
 https://api.themoviedb.org/3/movie/now_playing?api_key=789a3ad9fb130b33628be0e27eaf57c8&language=en-US
 
 nowPlaying = /movie/now_playing
 baseURL = https://api.themoviedb.org/3
 
*/

/*
 Image URL
 https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg
 
 posterPath = /or06FN3Dka5tukK1e9sl16pB3iy.jpg
 imageBaseURL = https://image.tmdb.org/t/p/w500
 
 aspectRatio = 7/10
 */

/*
 Movie Details
 https://api.themoviedb.org/3/movie/299534?api_key=789a3ad9fb130b33628be0e27eaf57c8&language=en-US
 
 */

// https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2014-09-15&primary_release_date.lte=2014-10-22&page=1&api_key=64b6f3a69e5717b13ed8a56fe4417e71

// _url : http://api.themoviedb.org/3/discover/movie?api_key=57a4269b6c0098d52f01d65572e57972&sort_by=popularity.desc



