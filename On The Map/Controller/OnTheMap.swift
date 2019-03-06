//
//  OnTheMap.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/11/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
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
    
    @IBAction func logoutBarButtonPressed(_ sender: Any) {
    
        //shows error expecting type?
        /*UdacityClient.sharedInstance().deleteASession(_, method: String, url: URL, jsonBody: [String:AnyObject], completionHandlerForDelete: (_, result: AnyObject?, _, error: NSError?) -> Void)*/
        
    }
    
    
    
}
