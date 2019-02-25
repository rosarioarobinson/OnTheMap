//
//  AddLocationViewController.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/7/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit

class AddLocationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var currentLocationTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var findLocationButton: UIButton!
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func findLocationTapped(_ sender: UIButton) {
    }
    
    //allows keyboard to move frame upwards
    @objc func keyboardWillShow(notification: NSNotification) {
        
    }
    
    //Initiate Geocoder to forward location
    func getCurrentLocation(completionHandler: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        CLGeocoder().geocodeAddressString(mapString!) { (placeMarks, err) in
            
            guard let firstLocation = placeMarks?.first?.location else { return }
            
            let latitude = firstLocation.coordinate.latitude
            let longitude = firstLocation.coordinate.longitude
            // Use above cororidnates and pass them to your final view controller.
        }
    }
    
    //hides the keyboard
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    //Once 'Find Location' is pressed, moves onto AddLocationFinalViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddLocationFinalViewController" {
            let addLocationFinalViewController = segue.destination as! AddLocationViewController
     
        }
    }
    
}
