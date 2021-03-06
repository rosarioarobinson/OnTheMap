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
   
    
     var annotations = [MKPointAnnotation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        ParseClient.sharedInstance().getStudentLocations { (result, error) in
            
            if (result != nil) {StudentArray.sharedInstance.studentsArray =  StudentInformation.studentInformationFromResults(result as! [[String : AnyObject]])}
                
            else {
            
            //insert StudentLocation structs
            for student in StudentArray.sharedInstance.studentsArray {
                
                //latitude and longitude
                let lat = CLLocationDegrees(student.latitude ?? 0)
                let long = CLLocationDegrees(student.longitude ?? 0)
                
                //latitude and longitude are used to create CLLocationCoordinates2D instance.
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                let first = student.firstName ?? ""
                let last = student.lastName ?? ""
                let mediaURL = student.mediaURL
                
                //added to properly handle cases where either first name, last name, or both are missing.
                var fullName = ""
                if first == "" && last == ""{
                    fullName = "No Name"
                }
                else if first == ""{
                    fullName =  last
                }
                else if last == ""{
                    fullName = first
                }
                else{
                    fullName = "\(first) \(last)"
                }
                
                //Here we create the annotation and set its coordiate, title, and subtitle properties
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = fullName
                annotation.subtitle = mediaURL
                
                //Finally we place the annotation in an array of annotations.
                self.annotations.append(annotation)
                
                
            }
            }
            
            //When the array is complete, we add the annotations to the map.            
            DispatchQueue.main.async {
                self.mapView.addAnnotations(self.annotations)
            }
           
            
        }
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ParseClient.sharedInstance().getStudentLocations { (result, error) in
            print(result)
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
