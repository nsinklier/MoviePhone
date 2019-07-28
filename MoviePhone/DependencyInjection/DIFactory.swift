//
//  DIFactory.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/27/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import Foundation

struct DIFactory {
    func movieHomeViewModel() -> MovieHomeViewModel {
        return MovieHomeViewModel(services: movieServices(), dataSource: moviesDataSource())
    }
    
    func movieServices() -> MovieServices {
        return MovieServices(urlFactory: urlFactory())
    }
    
    func urlFactory() -> URLFactory {
        return URLFactory()
    }
    
    func moviesDataSource() -> MoviesDataSource {
        return MoviesDataSource()
    }
}
