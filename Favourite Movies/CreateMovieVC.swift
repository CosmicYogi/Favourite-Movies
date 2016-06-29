//
//  CreateMovieVC.swift
//  Favourite Movies
//
//  Created by mitesh soni on 29/06/16.
//  Copyright © 2016 Mitesh Soni. All rights reserved.
//

import UIKit
import CoreData
class CreateMovieVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //All @IBOutlets are here
    @IBOutlet var movieTitle: UITextField!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var movieDescription: UITextView!
    
    //All declarations are here
    var imagePicker : UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.frame = CGRectMake(movieImage.frame.origin.x, movieImage.frame.origin.y, 200, 200);
        movieImage.clipsToBounds = true
        imagePicker = UIImagePickerController();
        imagePicker.delegate = self; //You always forget this.
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        movieImage.image = image;
        addImageButton.titleLabel?.text = "Add Another";
        dismissViewControllerAnimated(true, completion: nil);
        movieImage.frame = CGRectMake(movieImage.frame.origin.x, movieImage.frame.origin.y, 240.0, 240.0);
        movieImage.contentMode = .ScaleAspectFill;
        movieImage.clipsToBounds = true
    }
    
    @IBAction func onAddImageButtonDown(sender: AnyObject) {
        self.presentViewController(imagePicker, animated: true, completion: nil);
    }
    
    @IBAction func onSubmitDown(sender: AnyObject) {
        if let title = movieTitle.text where title != ""{
            let app = UIApplication.sharedApplication().delegate as! AppDelegate;
            let context = app.managedObjectContext;
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context);
            let  movie = Movie(entity: entity!, insertIntoManagedObjectContext: context);
            movie.movieName = title;
            movie.movieDetails = movieDescription.text;
            movie.setSetMovieImage(movieImage.image!);
            
            context.insertObject(movie);
            
            do{
                try context.save();
                print("context.save() executed");
            } catch {
                print("problem occured while saving movie");
            }
            //self.navigationController?.popViewControllerAnimated(true); //This only works with navigation controller. because in navigation controlly everything is in stack.
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        else{
            print("code din't function");
        }
    }
}