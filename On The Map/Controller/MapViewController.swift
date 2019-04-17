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

//Should this code be added to OnTheMap.swift??
//Or how to call it to OnTheMap?


class MapViewController: UIViewController, MKMapViewDelegate {
    
    //outlet connection to map
    @IBOutlet weak var mapView: MKMapView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var annotations = [MKPointAnnotation]()
        
        //insert StudentLocation structs
        for student in StudentArray.studentsArray {
            
        //latitude and longitude
            let lat = CLLocationDegrees(student.latitude ?? 0)
            let long = CLLocationDegrees(student.longitude ?? 0)
            
        //latitude and longitude are used to create CLLocationCoordinates2D instance.
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            let first = student.firstName
            let last = student.lastName
            let mediaURL = student.mediaURL
            
            //Here we create the annotation and set its coordiate, title, and subtitle properties
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(String(describing: first)) \(String(describing: last))"
            annotation.subtitle = mediaURL
            
            //Finally we place the annotation in an array of annotations.
            annotations.append(annotation)
            
            //When the array is complete, we add the annotations to the map.
            self.mapView.addAnnotations(annotations)
            
        }
        
    }
    
    //MARK: MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    //Method implemented to respond to taps
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let app = UIApplication.shared
            if let toOpen = view.annotation?.subtitle! {
                app.openURL(URL(string: toOpen)!)
            }
        }
    }
}
