//
//  ViewController.swift
//  Favourite Movies
//
//  Created by mitesh soni on 28/06/16.
//  Copyright © 2016 Mitesh Soni. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var movies = [Movie]();
    @IBOutlet var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self;
        movieTableView.dataSource = self;
        print(movies);
        
    }

    override func viewDidAppear(_ animated: Bool) {
        fetchAndSaveResults();
        movieTableView.reloadData();
    }

    func fetchAndSaveResults(){
        print("entered fetch and save results");
        let app = UIApplication.shared().delegate as! AppDelegate;
        let context = app.managedObjectContext;
        let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")
        print("reached below fetch and save results");
        
        var results = [Movie]()
        do{
            print("Entered DO");
            let fetchRequestResults = try context.fetch(fetchRequest)
            
            for result in fetchRequestResults {
                
                results.append(result)
                
            }
            
            print("Self.movies = results as [Movie] executed");
            print(self.movies.count);
//            print(self.movies[0].movieName);
//            print(self.movies[0].movieDetails);
//            print(self.movies[0].movieImage);
        } catch {
            print("Exception thrown while fetching data");
        }
        
        guard results.count > 0 else {
            
            return
            
        }
        
        self.movies = results as [Movie]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("entered  cell for row at index path");
        var identifier : String = "movieLight";
        if movies.isEmpty == false{
            print("Entered if movies.isEmpty == false");
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MovieCell{
            print("Entered dequeueReusableCellWithIdentifier(identifier) as? MovieCell");
            let movie = movies[(indexPath as NSIndexPath).row]
            print("executed let movie = movies[indexPath.row]")
            cell.configureCell(movie) // I think here is the problem.
            print("executed cell.configureCell(movie)");
            return cell;
        } else{
            print("entered else condition of equeueReusableCellWithIdentifier(identifier) as? MovieCell")
            let movie = movies[(indexPath as NSIndexPath).row]
            let cell = MovieCell();
            cell.configureCell(movie);
            return MovieCell();
        }
        } else{
            return MovieCell();
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
}

