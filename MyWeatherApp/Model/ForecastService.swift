//
//  ForecastService.swift
//  MyWeatherApp
//
//  Created by 1 on 05.09.18.
//  Copyright © 2018 Bogdan Magala. All rights reserved.
//

import Foundation
import Alamofire

class ForecastService {
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather(latitude: Double, longtitude: Double, completion: @escaping (CurrentWeather?) -> Void){
        if let forecastUrl = URL(string: "\(forecastBaseURL!)/\(latitude),\(longtitude)") {
            request(forecastUrl).responseJSON(completionHandler: { (response) in
                //If we get the data
                if let jsonDictionary = response.result.value as? [String: Any] {
                    //Accessing current data
                    if let currentWeatherDictionaty = jsonDictionary["currently"] as? [String: Any] {
                        //Filling previously created dict with data
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionaty)
                        completion(currentWeather)
                    } else {
                        completion(nil)
                    }
                }
            })
    }
}
}
