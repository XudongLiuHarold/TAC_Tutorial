//
//  WeatherModel.swift
//  LocationDemo
//
//  Created by Teng on 3/29/16.
//  Copyright © 2016 huoteng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherModel {
    func getWeather(lat:Double, lon:Double, resultHandler:(String, String) -> Void) {
//        let location = "\(lat):\(lon)"
//        Alamofire.request(.GET, "https://api.thinkpage.cn/v3/weather/now.json", parameters: ["key": "z81dtslpgnokdun3", "location": location], encoding: .URL, headers: nil)
//            .responseJSON { (response) -> Void in
//                if let data = response.result.value {
//                    print("data:\(data)")
//                    let jsonData = JSON(data)
//                    print(jsonData)
//                }
//        }
        
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather", parameters: ["lat": lat, "lon": lon, "appid": "168b476d6c0e2ad2fc8d16b81ec86018"], encoding: .URL, headers: nil)
            .responseJSON { (response) -> Void in
                if let data = response.result.value {
                    print("data:\(data)")
                    let jsonData = JSON(data)
                    let cityName = jsonData["name"].stringValue
                    let weatherDescription = jsonData["weather"][0]["description"].stringValue
                    resultHandler(cityName, weatherDescription)
                } else {
                    print("Can't get data")
                }
        }
    }
}