//
//  UserRouterObject.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation

struct UserRouter: Router {
    let rootPath = "/user"
    
    func createObjectPath() -> String {
        return rootPath
    }
    
    func readObjectPath(identifier: String) -> String {
        return "\(rootPath)/\(identifier)"
    }
    
    func updateObjectPath(identifier: String) -> String {
        return "\(rootPath)/\(identifier)"
    }
    
    func deleteObjectPath(identifier: String) -> String {
        return "\(rootPath)/\(identifier)"
    }
}