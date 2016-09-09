//
//  ErrorManager.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation

struct ErrorManager {
    enum Code: Int {
        case URLError                 = -6000
        case NetworkRequestFailed     = -6001
        case JSONSerializationFailed  = -6002
        case JSONParsingFailed        = -6003
    }
    
    let errorCode: Code
}
