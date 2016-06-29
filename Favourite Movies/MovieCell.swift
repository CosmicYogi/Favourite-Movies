//
//  MovieCell.swift
//  Favourite Movies
//
//  Created by mitesh soni on 28/06/16.
//  Copyright © 2016 Mitesh Soni. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var movieTitle: UILabel!
    
    @IBOutlet var movieDescription: UILabel!
    
    func configureCell(_ movie: Movie){
        self.movieImage.image = movie.getMovieImage();
        self.movieTitle.text = movie.movieName;
        self.movieDescription.text = movie.movieDetails;
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
