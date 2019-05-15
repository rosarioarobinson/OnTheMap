//
//  AddLocationViewController.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/7/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AddLocationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var currentLocationTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var findLocationButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var selectedLocation: userData?
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Subscribe to keyboard notifications to allow the view to raise when necessary
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    //MARK: Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func findLocationTapped(_ sender: UIButton) {
        
        //start animating activity indicator
        self.activityIndicator.startAnimating()
        
        if currentLocationTextField.text!.isEmpty || urlTextField.text!.isEmpty {
            self.displayError("There was an error that occurred, please try again.")
        }
        
        
        getCurrentLocation() { (result, errorString) in
            //stop activity indicator
            self.activityIndicator.stopAnimating()
            if (result != nil) {
                self.selectedLocation = result
                self.performSegue(withIdentifier: "ShowLocation", sender: nil)
                return
            } else {
                //error added from displayError function
                self.selectedLocation = nil
                self.displayError("")
                return
            }
        }
        
        
    }
    
    //allows keyboard to move frame upwards
    @objc func keyboardWillShow(notification: NSNotification) {
        
    }
    
    //Initiate Geocoder to forward location
    func getCurrentLocation(completionHandler: @escaping (_ result: userData?, _ error: NSError?) -> Void) {
        
        if let locationString = currentLocationTextField.text{
            CLGeocoder().geocodeAddressString(currentLocationTextField.text!) { (placeMarks, err) in
                
                guard let firstLocation = placeMarks?.first?.location else { return }
                
                //creating a new location using userData from UdacityUserData
                let userLocation = userData(uniqueKey: "", firstName: "", lastName: "", mapString: locationString, latitude: firstLocation.coordinate.latitude, longitude: firstLocation.coordinate.longitude, updatedAt: "", objectId: "", createdAt: "", mediaURL: self.urlTextField.text ?? "")
                completionHandler(userLocation, nil)
                
            }
        }
            
        else{
            // Show some error that the input is not present
            self.displayError("")
            
        }
    }
    
    //hides the keyboard
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    
    func displayError(_ errorString: String?) {
        // create the alert
        let alert = UIAlertController(title: "Error!", message: "Error, please try again.", preferredStyle: UIAlertControllerStyle.alert)
        // add an action
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //subscribe to keyboard notifications
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // unsubscribe to keyboard notifications
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    //Once 'Find Location' is pressed, moves onto AddLocationFinalViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowLocation" {
            let addLocationFinalViewController = segue.destination as! AddLocationFinalViewController
     
        }
    }
    
}
