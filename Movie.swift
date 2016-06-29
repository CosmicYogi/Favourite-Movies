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

// Insert code here to add functionality to your managed object subclass

    init(movieName: String,description: String, postImage: UIImage){
        self.movieName = movieName;
        self.movieDetails = description;
        //self.movieImage = postImage;
    }
}
