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

    override func viewDidAppear(animated: Bool) {
        fetchAndSaveResults();
        movieTableView.reloadData();
    }

    func fetchAndSaveResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate;
        let context = app.managedObjectContext;
        let fetchRequest = NSFetchRequest(entityName: "Movie");
        
        do{
            let results = try context.executeFetchRequest(fetchRequest);
            self.movies = results as! [Movie]
        } catch {
            print("Exception thrown while fetching data");
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var identifier : String = "movieLight";
        if let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? MovieCell{
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell;
        } else{
            let cell = MovieCell();
            cell.configureCell(movies[indexPath.row]);
            return cell;
        }
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
}

