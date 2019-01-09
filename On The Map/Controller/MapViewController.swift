//
//  MapViewController.swift
//  On The Map
//
//  Created by Rosario A Robinson on 11/18/18.
//  Copyright © 2018 Rosario Robinson. All rights reserved.
//

import UIKit
import MapKit

//Used PinSample app as a reference to build code for Map View Controller


class MapViewController: UIViewController, MKMapViewDelegate {
    
    //outlet connection to map
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = [MKPointAnnotation]()
        
        //insert StudentLocation structs
        for dictionary in ParseConstants.Methods.StudentLocations {
            
        //latitude and longitude
            let lat = CLLocationDegrees(dictionary.latitude ?? 0)
            let long = CLLocationDegrees(dictionary.longitude ?? 0)
            
        //latitude and longitude are used to create CLLocationCoordinates2D instance.
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            let first = dictionary["firstName"] as! String
            let last = dictionary["lastName"] as! String
            let mediaURL = dictionary["mediaURL"] as! String
            
            //Here we create the annotation and set its coordiate, title, and subtitle properties
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(first) \(last)"
            annotation.subtitle = mediaURL
            
            //Finally we place the annotation in an array of annotations.
            annotation.append(annotation)
            
            //When the array is complete, we add the annotations to the map.
            self.mapView.addAnnotations(annotation)
            
        }
        
    }
    
}
