//
//  StudentInformation.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/10/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation

struct StudentInformation {
    
    //MARK: Properties
    
    let ObjectID: String?
    let UniqueKey: String?
    let firstName: String?
    let lastName: String?
    let mapString: String?
    let mediaURL: String?
    let latitude: Double?
    let longitude: Double?
    let createdAt: String?
    let updatedAt: String?
    //static var studentArray : [StudentInformation] = []
    
    // MARK: Initializers
    
    init(dictionary: [String:AnyObject]) {
        
        ObjectID = dictionary[ParseConstants.JSONResponseKeys.ObjectID] as? String
        UniqueKey = dictionary[ParseConstants.JSONResponseKeys.UniqueKey] as? String
        firstName = dictionary[ParseConstants.JSONResponseKeys.firstName] as? String
        lastName = dictionary[ParseConstants.JSONResponseKeys.lastName] as? String
        mapString = dictionary[ParseConstants.JSONResponseKeys.mapString] as? String
        mediaURL = dictionary[ParseConstants.JSONResponseKeys.mediaURL] as? String
        latitude = dictionary[ParseConstants.JSONResponseKeys.latitude] as? Double
        longitude = dictionary[ParseConstants.JSONResponseKeys.longitude] as? Double
        createdAt = dictionary[ParseConstants.JSONResponseKeys.createdAt] as? String
        updatedAt = dictionary[ParseConstants.JSONResponseKeys.updatedAt] as? String
    }
    
    static func studentInformationFromResults(_ results: [[String:AnyObject]]) -> [StudentInformation] {
        
        var studentLocations = [StudentInformation]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            studentLocations.append(StudentInformation(dictionary: result))
        }
        
        return studentLocations
    }

    
}
