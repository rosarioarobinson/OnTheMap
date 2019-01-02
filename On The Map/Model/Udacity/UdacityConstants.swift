//
//  UdacityConstants.swift
//  On The Map
//
//  Created by Rosario A Robinson on 11/20/18.
//  Copyright © 2018 Rosario Robinson. All rights reserved.
//

import Foundation

class UdacityConstants {
    
    //MARK: Constants
    struct Constants {
        
        //MARK: API Key
        static let APP_ID = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let RestAPIKey = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        
        //MARK: URL
        static let ApiScheme: String = "https"
        static let ApiHost: String = "udacity.com"
        static let ApiPath: String = "/api"
        static let BaseURL: String = "https://www.udacity.com/api/"
        static let PublicUserURL: String = "https://onthemap-api.udacity.com/v1/session"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        static let Udacity: String = "udacity"
        static let username: String = "username"
        static let password: String = "password"
        static let accesstoken: String = "access_token"
    }
    
    //MARK: Methods
    struct Methods {
        
        static let StudentLocations = "/StudentLocation"
        static let Session = "/session"
    }
    
    //MARK:Response Keys
    struct JSONResponseKeys {
        static let Key: String = "key"
        static let Account: String = "account"
        static let firstName: String = "firstname"
        static let lastName: String = "lastname"
        static let Session: String = "session"
        static let SessionID: String = "ID"
        static let User: String = "user"
    }
}
