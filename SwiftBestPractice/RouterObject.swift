//
//  RouterObject.swift
//  SwiftBestPractice
//
//  Created by EricYang on 8/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation

protocol RouterObject{
    func createObjectPath()-> String
    func readObjectPath(identifier: String)-> String
    func updateObjectPath(identifier: String)-> String
    func deleteObjectPath(identifier: String)-> String
}
