//
//  ParseConstants.swift
//  On The Map
//
//  Created by Rosario A Robinson on 11/20/18.
//  Copyright © 2018 Rosario Robinson. All rights reserved.
//

import Foundation

class ParseConstants {
    
    //MARK: Constants
    struct Constants {
        
        //MARK: API Key
        static let APP_ID = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let RestAPIKey = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        
        //MARK: URL
        static let ApiScheme: String = "https"
        static let ApiHost: String = "parse.udacity.com"
        static let ApiPath: String = "/parse/classes"
        static let BaseURL: String = "https://parse.udacity.com/parse/classes"
    }
    
    //MARK: Methods
    struct Methods {
        
        static let StudentLocations = "/StudentLocation"
    }
    
    //MARK: Response Keys
    struct JSONResponseKeys {
        static let ObjectID: String = "objectId"
        static let UniqueKey: String = "uniqueKey"
        static let firstName: String = "firstName"
        static let lastName: String = "lastName"
        static let mapString: String = "mapString"
        static let mediaURL: String = "mediaURL"
        static let latitude: String = "latitude"
        static let longitude: String = "longitude"
        static let createdAt: String = "createdAt"
        static let updatedAt: String = "-updatedAt"
        static let requestToken = "request_token"
        static let SessionID = "session_id"
        static let ACL: String = "ACL"
    }
}
