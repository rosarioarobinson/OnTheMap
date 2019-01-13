//
//  UdacityConvenience.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/1/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit

extension UdacityClient {
    
    //POST
    //Note: This is where 'loginUser' for LoginViewController is from.
    
    func loginUser <ResponseType: Decodable>(username: String, password: String, url: URL, jsonBody: [String:AnyObject], response: ResponseType.Type, completionHandlerForPost: @escaping (ResponseType?, Error?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [UdacityConstants.Constants.PublicUserURL]
        let parameterKeys = [UdacityConstants.ParameterKeys.username + UdacityConstants.ParameterKeys.password]
        
        /* 2. Make the request */
        let _ = taskForPostMethod(url: URL(string: "https://www.udacity.com/api/session")!, jsonBody: jsonBody, response: ResponseType.self) { (results, error) in

            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForPost(nil, error)
            }
        }
        
    }
    
    //GET
    
    func getUserData <ResponseType: Decodable>(url: URL, response: ResponseType.Type, completionHandlerForGET: @escaping (ResponseType?, Error?) -> Void){
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [UdacityConstants.Methods.StudentLocations]
        
        /* 2. Make the request */
        let _ = taskForGetMethod(url: URL(string: "https://www.udacity.com/StudentLocation")!, response: ResponseType.self) { (results, error) in

            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForGET(nil, error)
            }
        }
        
    }
    
    //DELETE
    
    func deleteASession <ResponseType: Decodable>(url: URL, jsonBody: [String:AnyObject], response: ResponseType.Type, completionHandlerForDelete: @escaping (ResponseType?, Error?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [UdacityConstants.Methods.Session]
        
        /* 2. Make the request */
        let _ = taskForDeleteMethod(url: URL(string: "https://www.udacity.com/api/session")!, jsonBody: jsonBody, response: ResponseType.self) { (results, error) in

            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForDelete(nil, error)
            }
        }
        
    }
    
}

