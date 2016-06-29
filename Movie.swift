//
//  Movie.swift
//  Favourite Movies
//
//  Created by mitesh soni on 28/06/16.
//  Copyright © 2016 Mitesh Soni. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {
 
    func setSetMovieImage(movieImage: UIImage){
        let imageInDataFormat = UIImagePNGRepresentation(movieImage);
        self.movieImage = imageInDataFormat;
    }
    
    func getMovieImage() -> UIImage{
        return UIImage(data: self.movieImage!)!;
    }
}
