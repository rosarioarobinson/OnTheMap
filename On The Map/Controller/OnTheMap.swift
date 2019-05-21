//
//  OnTheMap.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/11/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit
import MapKit 

class TabBarViewController: UITabBarController {
    
    //MARK: Outlets
    
    @IBOutlet weak var logoutBarButton: UIBarButtonItem!
    @IBOutlet weak var refreshBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Actions
    
    @IBAction func logoutBarButtonPressed(_ sender: Any) {
    
        //logging out
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func refreshBarButtonPressed(_ sender: Any) {
        
    let mapViewController = self.viewControllers![0] as! MapViewController
    let tableViewController = self.viewControllers![1] as! TableViewController
    
    //added to help remove previous annotations before adding new student locations
    let annotations = mapViewController.mapView.annotations
    mapViewController.mapView.removeAnnotations(annotations)
        
    //get locations to download again
    ParseClient.sharedInstance().getStudentLocations { (studentLocations, error) in
        if let studentLocations = studentLocations {
            StudentArray.sharedInstance = studentLocations as! StudentArray
        DispatchQueue.main.async {
            if (studentLocations != nil) {
                //reload data
                mapViewController.mapView.addAnnotation(annotations as! MKAnnotation)
                //tableViewController.tableView.reloadData()
            } else {
                //error added from displayError function
                self.displayError("")
            }
            return
        }
        }
        }
    
    }
    
    
    @IBAction func addBarButtonPressed(_ sender: Any) {
        
        //Once 'add button' is pressed, moves onto

        let controller = self.storyboard!.instantiateViewController(withIdentifier: "AddLocationViewController") as! AddLocationViewController
        self.present(controller, animated: true, completion: nil)
        
        
        
    }
    
    
    func displayError(_ errorString: String?) {
        // create the alert
        let alert = UIAlertController(title: "Error!", message: "Sorry, please try again.", preferredStyle: UIAlertControllerStyle.alert)
        // add an action
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}
