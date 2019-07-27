//
//  ViewController.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/20/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = MovieServices()
        service.nowPlaying { result in
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
            
        }
    }


}

