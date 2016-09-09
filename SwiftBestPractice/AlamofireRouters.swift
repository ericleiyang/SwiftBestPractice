//
//  AlamofireRouters.swift
//  SwiftBestPractice
//
//  Created by EricYang on 8/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation
import Alamofire

let baseURLString = "http://api.openweathermap.org/data/2.5"
var OAuthToken: String?

enum AlamofireRouter<T where T: Router >: URLRequestConvertible{
    case CreateObject(T, [String: AnyObject])
    case ReadObject(T, NSDictionary)
    case UpdateObject(T, String, [String: AnyObject])
    case DeleteObject(T, String)
    
    var method: Alamofire.Method {
        switch self {
        case .CreateObject:
            return .POST
        case .ReadObject:
            return .GET
        case .UpdateObject:
            return .PUT
        case .DeleteObject:
            return .DELETE
        }
    }
    
    var path: String {
        switch self {
        case .CreateObject(let object, _):
            return object.createObjectPath()
        case .ReadObject(let object, let parameters):
            return object.readObjectPath(parameters)
        case .UpdateObject(let object, let identifier, _):
            return object.updateObjectPath(identifier)
        case .DeleteObject(let object, let identifier):
            return object.deleteObjectPath(identifier)
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: baseURLString.stringByAppendingString(path))!
        
        let mutableURLRequest = NSMutableURLRequest(URL: URL)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = OAuthToken {
            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .CreateObject(_, let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .UpdateObject(_, _, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}
