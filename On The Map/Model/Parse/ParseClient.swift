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
        func taskForGetALocation <ResponseType: Decodable>(url: URL, response: ResponseType.Type, completionHandlerForGET: @escaping (ResponseType?, Error?) -> Void) {
            
            //Parameters
            let url = URL(string:ParseConstants.Constants.BaseURL + ParseConstants.Methods.StudentLocations)
            
            //URL Request
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue(ParseConstants.Constants.APP_ID, forHTTPHeaderField: "X-Parse-Application-Id")
            request.addValue(ParseConstants.Constants.RestAPIKey, forHTTPHeaderField: "X-Parse-REST-API-Key")
            
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
    
    
    //MARK: Get multiple student locations
    func taskForGetMultipleLocations <ResponseType: Decodable>(url: URL, response: ResponseType.Type, completionHandlerForGetMultipleLocations: @escaping (ResponseType?, Error?) -> Void) {
        
        //URL Request
        var request = URLRequest(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation?limit=100")!)
        request.httpMethod = "GET"
        request.addValue(ParseConstants.Constants.APP_ID, forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue(ParseConstants.Constants.RestAPIKey, forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        //create task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGetMultipleLocations(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
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
                    completionHandlerForGetMultipleLocations(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForGetMultipleLocations(nil, error)
                }
            }
        }
        task.resume()
    }
    
    
    //MARK: POST Student Locations
    func taskForPostALocation <ResponseType: Decodable>(url: URL, jsonBody: [String:AnyObject], response: ResponseType.Type, completionHandlerForPost: @escaping (ResponseType?, Error?) -> Void) {
        
        //Parameters
        let url = URL(string:ParseConstants.Constants.BaseURL + ParseConstants.Methods.StudentLocations)
        
        //URL Request
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue(ParseConstants.Constants.APP_ID, forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue(ParseConstants.Constants.RestAPIKey, forHTTPHeaderField: "X-Parse-REST-API-Key")
        
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
    
    //MARK: PUT Student Locations
    func taskForPutALocation <ResponseType: Decodable>(url: URL, jsonBody: [String:AnyObject], response: ResponseType.Type, completionHandlerForPUT: @escaping (ResponseType?, Error?) -> Void) {
        
        //Parameters
        let url = URL(string:ParseConstants.Constants.BaseURL + ParseConstants.Methods.StudentLocations + ParseConstants.JSONResponseKeys.ObjectID)
        
        //URL Request
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.addValue(ParseConstants.Constants.APP_ID, forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue(ParseConstants.Constants.RestAPIKey, forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        //Pass Body to the Request
        do {
            request.httpBody = try! JSONSerialization.data(withJSONObject: jsonBody, options: .prettyPrinted)
        }
        
        
        //create task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForPUT(nil, NSError(domain: "taskForPUTMethod", code: 1, userInfo: userInfo))
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
                    completionHandlerForPUT(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForPUT(nil, error)
                }
            }
        }
        task.resume()
    }
    
    // MARK: Shared Instance
    class func sharedInstance() -> ParseClient {
        struct Singleton {
            static var sharedInstance = ParseClient()
        }
        
        return Singleton.sharedInstance
    }
        
    }

