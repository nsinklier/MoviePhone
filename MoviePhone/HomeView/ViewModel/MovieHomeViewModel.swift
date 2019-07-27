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
    
    

}
