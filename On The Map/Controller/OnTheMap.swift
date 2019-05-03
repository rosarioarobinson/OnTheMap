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
        
        //error, states: 'getStudentLocations' is inaccessible due to 'private' protection level'
        //ParseClient.sharedInstance().getStudentLocations()
        
    }
    
    @IBAction func addBarButtonPressed(_ sender: Any) {
        
        //Once 'add button' is pressed, moves onto

        let controller = self.storyboard!.instantiateViewController(withIdentifier: "AddLocationViewController") as! AddLocationViewController
        self.present(controller, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
}
