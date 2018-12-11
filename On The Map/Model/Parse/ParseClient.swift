//
//  ParseClient.swift
//  On The Map
//
//  Created by Rosario A Robinson on 11/20/18.
//  Copyright © 2018 Rosario Robinson. All rights reserved.
//

import Foundation

class ParseClient {
    
    static let shared = ParseClient()
    
    // shared session
    var session = URLSession.shared
    
    //MARK: Get single student location
    func taskForGetALocation(_ method: String, parameters: [String:AnyObject], completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        //Set the parameters
        //var urlParameters = parameters
       // urlParameters.BaseURL = ParseConstants.URL
        
        
        
    }
}
