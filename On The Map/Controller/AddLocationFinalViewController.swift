//
//  AddLocationFinalViewController.swift
//  On The Map
//
//  Created by Rosario A Robinson on 2/20/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AddLocationFinalViewController: UIViewController, MKMapViewDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var finishButton: UIButton!
    
    
    var annotations = [MKPointAnnotation]()
    
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.delegate = self
        
        //insert StudentLocation structs
        for student in StudentArray.sharedInstance.studentsArray {
            
            //latitude and longitude
            let lat = CLLocationDegrees(student.latitude ?? 0)
            let long = CLLocationDegrees(student.longitude ?? 0)
            
            //latitude and longitude are used to create CLLocationCoordinates2D instance.
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            // represent latitude of the new location
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 0.25, longitudinalMeters: 0.25);
            
            mapView.setRegion(region, animated: true)
            
            let first = student.firstName ?? ""
            let last = student.lastName ?? ""
            let mediaURL = student.mediaURL
            
            //Here we create the annotation and set its coordiate, title, and subtitle properties
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(String(describing: first)) \(String(describing: last))"
            annotation.subtitle = mediaURL
            
            //Finally we place the annotation in an array of annotations.
            self.annotations.append(annotation)
            
        }
        
        //When the array is complete, we add the annotations to the map.
        DispatchQueue.main.async {
            self.mapView.addAnnotations(self.annotations)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Actions
    @IBAction func finishButtonTapped(_ sender: Any) {
        
        //Add code for Parse to post and put location??
        
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
