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
    
    private func getStudentLocations<ResponseType: Decodable>(url: URL, response: ResponseType.Type, completionHandlerForGET: @escaping (ResponseType?, Error?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [ParseConstants.JSONResponseKeys.requestToken]
        
        /* 2. Make the request */
        let _ = taskForGetMultipleLocations(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!, response: String.self) { (results, error) in
            
        var request = URLRequest(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation")!)
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                print(error)
            } else {
                if let sessionID = results?[ParseConstants.JSONResponseKeys.SessionID] as? String {
                    completionHandlerForGET(true, sessionID, nil)
                } else {
                    print("Could not find \(ParseConstants.JSONResponseKeys.SessionID) in \(results)")
                }
            }
        }
    }

    
}

