//
//  ViewController.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/20/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = DIFactory().movieHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.populateData()
    }


}

