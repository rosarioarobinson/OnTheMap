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
    
    private func getStudentLocations(_ requestToken: String?, completionHandlerForSession: @escaping (_ success: Bool, _ sessionID: String?, _ errorString: String?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [ParseConstants.JSONResponseKeys.requestToken: requestToken!]
        
        /* 2. Make the request */
        let _ = taskForGetMultipleLocations(url:(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!) as! URL, response: parameters as [AnyObject]) { (results, error) in
            
        var request = URLRequest(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!)
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                print(error)
                completionHandlerForGetALocation(false, nil, "Login Failed (Session ID).")
            } else {
                if let sessionID = results?[ParseConstants.JSONResponseKeys.SessionID] as? String {
                    completionHandlerForSession(true, sessionID, nil)
                } else {
                    print("Could not find \(ParseConstants.JSONResponseKeys.SessionID) in \(results)")
                    completionHandlerForSession(false, nil, "Login Failed (Session ID).")
                }
            }
        }
    }

    
}
