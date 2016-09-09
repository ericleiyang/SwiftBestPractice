//
//  WeatherRouter.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation

struct ForecastRouter: Router {
    let rootPath = "/forecast"
    
    func readObjectPath(parameters: NSDictionary) -> String {
//        return "\(rootPath)/\(identifier)"
        let urlString = urlWithComponents(parameters)
        return urlString!
    }
    
    private func urlWithComponents(parameters: NSDictionary) -> String?{
    
        guard let components = NSURLComponents(string:rootPath) else {
            return nil
        }
    
        // get appId from Info.plist
        let filePath = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")!
        let contentsOfFile = NSDictionary(contentsOfFile:filePath)
        let appId = contentsOfFile!["OWMAccessToken"]!.description
    
        let latitude = String(parameters["latitude"]!)
        let longitude = String(parameters["longitude"]!)
    
        components.queryItems = [NSURLQueryItem(name:"lat", value:latitude),
                                 NSURLQueryItem(name:"lon", value:longitude),
                                 NSURLQueryItem(name:"APPID", value:String(appId))]
    
        return components.URLString
    }
    
}