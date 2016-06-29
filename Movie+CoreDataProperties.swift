//
//  Movie+CoreDataProperties.swift
//  Favourite Movies
//
//  Created by mitesh soni on 28/06/16.
//  Copyright © 2016 Mitesh Soni. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var movieName: String?
    @NSManaged var movieDetails: String?
    @NSManaged var movieImage: Data?

}
