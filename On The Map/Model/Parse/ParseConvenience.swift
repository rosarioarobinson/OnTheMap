//
//  ParseConvenience.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/1/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit

extension ParseClient {
    
    //MARK: Authenticating Users
    //GET
    
    private func getStudentLocations (_ method: String, url: URL, completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [ParseConstants.Methods.StudentLocations]
        
        /* 2. Make the request */
        let _ = taskForGetMultipleLocations(method, url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!) { (results, error) in
            
        /*var request = URLRequest(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!)*/
            
            /* 3. Send the desired value(s) to completion handler */
            //note:deprecated if let statement, kept getting this error: 'Type 'ResponseType' has no subscript members'
            if let error = error {
                completionHandlerForGET(nil, error)
            } else {
                
                if let results = results?[ParseConstants.JSONResponseKeys.requestToken] as? [[String:AnyObject]] {
                    completionHandlerForGET(results as AnyObject, nil)
                } else {
                    completionHandlerForGET(nil, NSError(domain: "getStudentLocations", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse student data"]))
                }
            }
            }
        }
    
    //POST
    private func postStudentLocation (_ method: String, url: URL, jsonBody: [String:AnyObject], completionHandlerForPost: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [ParseConstants.Methods.StudentLocations]
        
        /* 2. Make the request */
        let _ = taskForPostALocation(method, url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!, jsonBody: (jsonBody as AnyObject) as! [AnyObject]) { (results, error) in
            
        /*var request = URLRequest(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!)*/
            
            /* 3. Send the desired value(s) to completion handler */
            //note:deprecated if let statement, kept getting this error: 'Type 'ResponseType' has no subscript members'
            if let error = error {
                completionHandlerForPost(nil, error)
            } else {
             
             if let results = results?[ParseConstants.JSONResponseKeys.requestToken] as? [[String:AnyObject]] {
                completionHandlerForPost(results as AnyObject, nil)
             } else {
                completionHandlerForPost(nil, NSError(domain: "getStudentLocations", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse student data"]))
             }
             }
        }
        
    }
    
    //PUT
    private func putStudentLocation (_ method: String, url: URL, jsonBody: [String:AnyObject], completionHandlerForPUT: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void){
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [ParseConstants.Methods.StudentLocations]
        
        /* 2. Make the request */
        let _ = taskForPutALocation(method, url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!, jsonBody: (jsonBody as AnyObject) as! [AnyObject]) { (results, error) in
            
            /*var request = URLRequest(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!)*/
            
            /* 3. Send the desired value(s) to completion handler */
            //note:deprecated if let statement, kept getting this error: 'Type 'ResponseType' has no subscript members'
            if let error = error {
                completionHandlerForPUT(nil, error)
            } else {
             
             if let results = results?[ParseConstants.JSONResponseKeys.requestToken] as? [[String:AnyObject]] {
                completionHandlerForPUT(results as AnyObject, nil)
             } else {
                completionHandlerForPUT(nil, NSError(domain: "getStudentLocations", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse student data"]))
             }
             }
        }
        
    }
    
    
    }

    


