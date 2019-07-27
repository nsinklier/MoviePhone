//
//  URLFactory.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/27/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import Foundation

struct URLFactory {
    private let baseURL = "https://api.themoviedb.org/3/"
    private let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
    private let apiKey = "api_key=789a3ad9fb130b33628be0e27eaf57c8"
    private let language = "language=en-US"
    
    private let getNowPlaying = "movie/now_playing"
    
    func nowPlayingURL(page: Int) -> URL? {
        return URL(string: baseURL + getNowPlaying + "?" + apiKey + "&" + language + "&" + "page=\(page)")
    }
}
