//
//  CreateMovieVC.swift
//  Favourite Movies
//
//  Created by mitesh soni on 29/06/16.
//  Copyright © 2016 Mitesh Soni. All rights reserved.
//

import UIKit
import CoreData
class CreateMovieVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    //All @IBOutlets are here
    @IBOutlet var movieTitle: UITextField!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var movieDescription: UITextView!
    
    //All declarations are here
    var imagePicker : UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.frame = CGRect(x: movieImage.frame.origin.x, y: movieImage.frame.origin.y, width: 200, height: 200);
        movieImage.clipsToBounds = true
        imagePicker = UIImagePickerController();
        imagePicker.delegate = self; //You always forget this.
        movieTitle.delegate = self
        movieDescription.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        movieImage.image = info[UIImagePickerControllerOriginalImage] as! UIImage
        addImageButton.titleLabel?.text = "Add Another";
        movieImage.frame = CGRect(x: movieImage.frame.origin.x, y: movieImage.frame.origin.y, width: 240.0, height: 240.0);
        movieImage.contentMode = .scaleAspectFill;
        movieImage.clipsToBounds = true
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onAddImageButtonDown(_ sender: AnyObject) {
        self.present(imagePicker, animated: true, completion: nil);
    }
    
    @IBAction func onSubmitDown(_ sender: AnyObject) {
        if let title = movieTitle.text where title != ""{
            let app = UIApplication.shared().delegate as! AppDelegate;
            let context = app.managedObjectContext;
            let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context);
            let  movie = Movie(entity: entity!, insertInto: context);
            movie.movieName = title;
            movie.movieDetails = movieDescription.text;
            movie.setSetMovieImage(movieImage.image!);
            
            context.insert(movie);
            
            do{
                try context.save();
                print("context.save() executed");
            } catch {
                print("problem occured while saving movie");
            }
            //self.navigationController?.popViewControllerAnimated(true); //This only works with navigation controller. because in navigation controlly everything is in stack.
            self.dismiss(animated: true, completion: nil);
        }
        else{
            print("code din't function");
        }
    }
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
