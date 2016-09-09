//
//  WeatherService.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


typealias WeatherCompletionHandler = (Weather?, Error?) -> Void

struct WeatherService {
    
    func retrieveWeatherInfo(parameters: NSDictionary, completionHandler: WeatherCompletionHandler) {

        let URLRequest = AlamofireRouter.ReadObject(ForecastRouter(), parameters).URLRequest
        Alamofire.request(URLRequest)
            .response { request, response, data, error in
                
                // Check network error
                guard error == nil else {
                    let error = Error(errorCode: .NetworkRequestFailed)
                    completionHandler(nil, error)
                    return
                }
                
                // Check JSON serialization error
                guard let unwrappedData = data else {
                    let error = Error(errorCode: .JSONSerializationFailed)
                    completionHandler(nil, error)
                    return
                }
                
                let json = JSON(data: unwrappedData)
                
                // Get temperature, location and icon and check parsing error
                guard let tempDegrees = json["list"][0]["main"]["temp"].double,
                    country = json["city"]["country"].string,
                    city = json["city"]["name"].string,
                    weatherCondition = json["list"][0]["weather"][0]["id"].int,
                    iconString = json["list"][0]["weather"][0]["icon"].string else {
                        let error = Error(errorCode: .JSONParsingFailed)
                        completionHandler(nil, error)
                        return
                }
                
                let temperature = Temperature(country: country, openWeatherMapDegrees:tempDegrees)
                let weatherIcon = WeatherIcon(condition: weatherCondition, iconString: iconString)
                let iconText = weatherIcon.iconText
                let forecasts = self.getFirstFourForecasts(json)
                
                let weather = Weather(location: city, iconText: iconText, temperature: temperature.degrees, forecasts: forecasts)
                
                completionHandler(weather, nil)
        }
    }
    
    private func getFirstFourForecasts(json: JSON) -> [Forecast] {
        var forecasts: [Forecast] = []
        
        let country = json["city"]["country"].string
        
        
        
        for index in 0...3 {
            
            let forecastJson = json["list"][index]
            
            guard let forecast = Forecast.initWithJSON(forecastJson, country: country!) else{
                break
            }
            
            forecasts.append(forecast)
        }
        
        return forecasts
    }

}
