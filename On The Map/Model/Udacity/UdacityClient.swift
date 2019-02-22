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
    func taskForGetMethod(_ method: String, url: URL, completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
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
            guard data != nil else {
                sendError("No data was returned by the request!")
                return
            }
            
            
            //JSON
           /* do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandlerForGET(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForGET(nil, error as NSError)
                }
            }*/
        }
        task.resume()
    }

    //POSTing a Session
    
    func taskForPostMethod(_ method: String, url: URL, username: String, password: String, completionHandlerForPost: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        //Parameters
        let url = URL(string:UdacityConstants.Constants.PublicUserURL)
        
        //URL Request
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = "{\"udacity\": {\"username\": \"username\", \"password\": \"password\"}}".data(using: .utf8)
        
        //Pass Body to the Request
        /*do {
            request.httpBody = try! JSONSerialization.data(withJSONObject: jsonBody, options: .prettyPrinted)
        }*/
        
        
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
            guard data != nil else {
                sendError("No data was returned by the request!")
                return
            }
            
            //JSON
            /*do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandlerForPost(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForPost(nil, error)
                }
            }*/
        }
        task.resume()
    }
    
    //DELETing a Session
    
    func taskForDeleteMethod(_ method: String, url: URL, jsonBody: AnyObject, completionHandlerForDelete: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
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
            guard data != nil else {
                sendError("No data was returned by the request!")
                return
            }
            
            //JSON
           /* do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandlerForDelete(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForDelete(nil, error)
                }
            }*/
        }
        task.resume()
    }
    
    // given raw JSON, return a usable Foundation object
    private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        var parsedResult: AnyObject! = nil
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandlerForConvertData(parsedResult, nil)
    }
    
    // MARK: Shared Instance
    class func sharedInstance() -> UdacityClient {
        struct Singleton {
            static var sharedInstance = UdacityClient()
        }
        
        return Singleton.sharedInstance
    }
    
}
