//
//  NSDate+ShortTime.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import UIKit

extension NSDate {
    
    static func shortTime(rawDate: Double) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = NSDate(timeIntervalSince1970: rawDate)
        return dateFormatter.stringFromDate(date)
    }
    
}
