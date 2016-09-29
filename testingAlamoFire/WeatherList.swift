//
//  WeatherInformation.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/28/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import Foundation
import Alamofire

var weatherReportList = [HistoryWeather()]

class WeatherList {
    var weatherTableIndex: NSArray
    
    init () {
        self.weatherTableIndex = []
    }
    
    func getWeatherListArrIndex (completionWithSuccess: @escaping (()->Void)) {
        Alamofire.request("http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json").responseJSON { response in
            switch response.result {
            case .success:
                //JSON     //data
                let json = response.result.value as! NSDictionary
                let data = json.value(forKey: "data") as! NSDictionary
                //weather Index vvvvv vvvvv vvvvv vvvvv vvvvv vvvvv
                let weather = data.value(forKey: "weather") as! NSArray
                
                self.weatherTableIndex = weather
                
                completionWithSuccess();
                break;
            case .failure:
                let error = response.result.error as! NSError
                print("Network error !");
                print(error.localizedDescription);
                break;
            }
        }
    }
}
