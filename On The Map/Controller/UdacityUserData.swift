//
//  UdacityUserData.swift
//  On The Map
//
//  Created by Rosario A Robinson on 4/30/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit


 struct userData {
    
    var uniqueKey: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var mapString: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var updatedAt: String = ""
    var objectId: String = ""
    var createdAt: String = ""
    var mediaURL: String = ""
}

var shared: userData = userData()
