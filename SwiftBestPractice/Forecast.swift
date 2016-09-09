//
//  Forecast.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Forecast {
    let time: String
    let iconText: String
    let temperature: String
    
    static func initWithJSON(json: JSON, country: String) -> Forecast? {

        guard let forecastTempDegrees = json["main"]["temp"].double,
            rawDateTime = json["dt"].double,
            forecastCondition = json["weather"][0]["id"].int,
            forecastIcon = json["weather"][0]["icon"].string else {
                return nil
        }
    
        let forecastTemperature = Temperature(country: country,
                                              openWeatherMapDegrees: forecastTempDegrees)
        let forecastTimeString = NSDate.shortTime(rawDateTime)
        let weatherIcon = WeatherIcon(condition: forecastCondition, iconString: forecastIcon)
        let forcastIconText = weatherIcon.iconText
    
        let forecast = Forecast(time: forecastTimeString,
                                iconText: forcastIconText,
                                temperature: forecastTemperature.degrees)
        
        return forecast
    }
}