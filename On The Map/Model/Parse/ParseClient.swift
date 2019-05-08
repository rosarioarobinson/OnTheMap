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
        func taskForGetALocation (_ method: String, url: URL, completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
            
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
                guard data != nil else {
                    sendError("No data was returned by the request!")
                    return
                }
                
                
                //JSON
                /*do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(ResponseType.self, from: data)
                    DispatchQueue.main.async {
                        completionHandlerForGET(responseObject, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandlerForGET(nil, error)
                    }
                }*/
            }
            task.resume()
        }
    
    
    //MARK: Get multiple student locations
    func taskForGetMultipleLocations (_ method: String, url: URL, completionHandlerForGetMultipleLocations: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        //URL Request
        var request = URLRequest(url: URL(string: "https://parse.udacity.com/parse/classes/StudentLocation?limit=100&order=-updatedAt")!)
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
            guard data != nil else {
                sendError("No data was returned by the request!")
                return
            }
            
            //calling completion handler
            
            let parsedResult: [String:AnyObject]!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:AnyObject]
            } catch {
                return
            }
            if let result = parsedResult["results"] as? [[String:AnyObject]]{
                completionHandlerForGetMultipleLocations(result as AnyObject,nil)
            }
            print(String(data: data!, encoding: .utf8)!)
            
        }
        
        task.resume()
    }
    
    
    //MARK: POST Student Locations
    func taskForPostALocation (_ method: String, url: URL, jsonBody: [AnyObject], completionHandlerForPost: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
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
    
    //MARK: PUT Student Locations
    func taskForPutALocation (_ method: String, url: URL, jsonBody: [AnyObject], completionHandlerForPut: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
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
                completionHandlerForPut(nil, NSError(domain: "taskForPUTMethod", code: 1, userInfo: userInfo))
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
                    completionHandlerForPUT(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandlerForPUT(nil, error)
                }
            }*/
        }
        task.resume()
    }
    
    // given raw JSON, return a usable Foundation object
    public func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
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
    class func sharedInstance() -> ParseClient {
        struct Singleton {
            static var sharedInstance = ParseClient()
        }
        
        return Singleton.sharedInstance
    }
        
    }

