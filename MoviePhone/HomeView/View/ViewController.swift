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
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func populateData() {
        viewModel.populateData()
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 400)
    }
}

