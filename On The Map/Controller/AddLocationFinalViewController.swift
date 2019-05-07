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
    
    
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Actions
    @IBAction func finishButtonTapped(_ sender: Any) {
        
        //Add code for Parse to post and put location??
        
    }
    
    
}


