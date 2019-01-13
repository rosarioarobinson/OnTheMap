//
//  UdacityClient.swift
//  On The Map
//
//  Created by Rosario A Robinson on 11/20/18.
//  Copyright © 2018 Rosario Robinson. All rights reserved.
//

import Foundation

class UdacityClient {
    
    static let shared = UdacityClient()
    
    // Shared session
    var session = URLSession.shared
    
    // To authenticate
    var SessionID: String? = nil
    
    //GETting Public User Data
    func taskForGetMethod <ResponseType: Decodable>(url: URL, response: ResponseType.Type, completionHandlerForGET: @escaping (ResponseType?, Error?) -> Void) {
        
        //Parameters
        let url = URL(string:UdacityConstants.Constants.BaseURL + UdacityConstants.Methods.StudentLocations)
        
        //Request
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        //create task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            
            //JSON
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandlerForGET(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForGET(nil, error)
                }
            }
        }
        task.resume()
    }

    //POSTing a Session
    
    func taskForPostMethod <ResponseType: Decodable>(url: URL, jsonBody: [String:AnyObject], response: ResponseType.Type, completionHandlerForPost: @escaping (ResponseType?, Error?) -> Void) {
        
        //Parameters
        let url = URL(string:UdacityConstants.Constants.PublicUserURL)
        
        //URL Request
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = "{\"udacity\": {\"username\": \"account@domain.com\", \"password\": \"********\"}}".data(using: .utf8)
        
        //Pass Body to the Request
        do {
            request.httpBody = try! JSONSerialization.data(withJSONObject: jsonBody, options: .prettyPrinted)
        }
        
        
        //create task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForPost(nil, NSError(domain: "taskForPOSTMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            //JSON
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandlerForPost(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForPost(nil, error)
                }
            }
        }
        task.resume()
    }
    
    //DELETing a Session
    
    func taskForDeleteMethod <ResponseType: Decodable>(url: URL, jsonBody: [String:AnyObject], response: ResponseType.Type, completionHandlerForDelete: @escaping (ResponseType?, Error?) -> Void) {
        
        //Parameters
        let url = URL(string:UdacityConstants.Constants.BaseURL + UdacityConstants.Methods.Session)
        
        //URL Request
        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        
        //Request Delete
        var xsrfCookie: HTTPCookie? = nil
        let sharedCookieStorage = HTTPCookieStorage.shared
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
        }
        if let xsrfCookie = xsrfCookie {
            request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
        }
        
        
        //create task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForDelete(nil, NSError(domain: "taskForDELETEMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            //JSON
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandlerForDelete(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForDelete(nil, error)
                }
            }
        }
        task.resume()
    }
    
    // MARK: Shared Instance
    class func sharedInstance() -> UdacityClient {
        struct Singleton {
            static var sharedInstance = UdacityClient()
        }
        
        return Singleton.sharedInstance
    }
    
}
