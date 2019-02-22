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
    
    func loginUser (usernameLogin: String, passwordLogin: String, url: URL, jsonBody: [String], completionHandlerForPost: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [UdacityConstants.Constants.PublicUserURL]
        let parameterKeys = [UdacityConstants.ParameterKeys.username + UdacityConstants.ParameterKeys.password]
        let httpBody: String = "{\"udacity\": {\"username\": \"username\", \"password\": \"password\"}}"
        

        
        /* 2. Make the request */
        let _ = taskForPostMethod(usernameLogin, url: URL(string: "https://www.udacity.com/api/session")!, username: usernameLogin, password: passwordLogin) { (results, error) in

            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForPost(nil, error)
            }
        }
        
    }
    
    //GET
    
    func getUserData (_ method: String, url: URL, completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void){
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [UdacityConstants.Methods.StudentLocations]
        
        /* 2. Make the request */
        let _ = taskForGetMethod(method, url: URL(string: "https://www.udacity.com/StudentLocation")!) { (results, error) in

            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForGET(nil, error)
            }
        }
        
    }
    
    //DELETE
    
    func deleteASession (_ method: String, url: URL, jsonBody: [String:AnyObject], completionHandlerForDelete: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [UdacityConstants.Methods.Session]
        
        /* 2. Make the request */
        let _ = taskForDeleteMethod(method, url: URL(string: "https://www.udacity.com/api/session")!, jsonBody: jsonBody as AnyObject) { (results, error) in

            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForDelete(nil, error)
            }
        }
        
    }
    
}

