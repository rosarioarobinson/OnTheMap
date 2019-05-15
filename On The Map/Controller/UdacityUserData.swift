//
//  UdacityUserData.swift
//  On The Map
//
//  Created by Rosario A Robinson on 4/30/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit

//struct created for AddLocationFinalViewController

 struct userData {
    
    var uniqueKey: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var mapString: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var updatedAt: String = ""
    var objectId: String = ""
    var createdAt: String = ""
    var mediaURL: String = ""
}

var shared: userData = userData()
