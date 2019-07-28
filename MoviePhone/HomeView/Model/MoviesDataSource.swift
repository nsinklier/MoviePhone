//
//  MoviesDataSource.swift
//  MoviePhone
//
//  Created by Nick Sinklier on 7/28/19.
//  Copyright © 2019 NorpSwizzler. All rights reserved.
//

import UIKit

class MoviesDataSource: NSObject, UICollectionViewDataSource {
    var movieData = [MovieCellData]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! MovieCell
        cell.title.text = movieData[indexPath.row].title
        cell.image.image = movieData[indexPath.row].image
        return cell
    }
    
    
    
}
