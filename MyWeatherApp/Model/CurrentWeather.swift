//
//  CurrentWeather.swift
//  MyWeatherApp
//
//  Created by 1 on 05.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import Foundation

class CurrentWeather {
    let temperature: Int?
    
    struct WeatherKeys {
        static let temperature = "temperature"
}

    init(weatherDictionary: [String: Any]) {
        if let temperatureDouble = weatherDictionary[WeatherKeys.temperature] as? Double {
            temperature = Int((temperatureDouble - 32) / 1.8)
        } else {
            temperature = nil
        }
    }
}
