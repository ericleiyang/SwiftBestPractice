//
//  ForecastViewModel.swift
//  SwiftBestPractice
//
//  Created by EricYang on 9/09/2016.
//  Copyright © 2016 EricYang. All rights reserved.
//

import Foundation

struct ForecastViewModel {
    let time: Observable<String>
    let iconText: Observable<String>
    let temperature: Observable<String>
    
    init(_ forecast: Forecast) {
        time = Observable(forecast.time)
        iconText = Observable(forecast.iconText)
        temperature = Observable(forecast.temperature)
    }
}
