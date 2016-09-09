//
//  Temperature.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation

struct Temperature {
    let degrees: String
    
    init(country: String, openWeatherMapDegrees: Double) {
        if country == "US" {
            degrees = String(Double.kelvinToFahrenheit(openWeatherMapDegrees)) + "\u{f045}"
        } else {
            degrees = String(Double.kelvinToCelsius(openWeatherMapDegrees)) + "\u{f03c}"
        }
    }
}

extension Double{
    static func kelvinToCelsius(degrees: Double) -> Double {
        return round(degrees - 273.15)
    }
    
    static func kelvinToFahrenheit(degrees: Double) -> Double {
        return round(degrees * 9 / 5 - 459.67)
    }
}