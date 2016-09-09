//
//  Weather.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation

struct Weather {
    let location: String
    let iconText: String
    let temperature: String
    
    let forecasts: [Forecast]
    
    init(location: String, iconText: String, temperature: String, forecasts: [Forecast]){
        self.location = location;
        self.iconText = iconText;
        self.temperature = temperature;
        self.forecasts = forecasts;
    }
}

