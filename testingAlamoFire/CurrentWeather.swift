//
//  WeatherData-current.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/28/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class CurrentWeather {
        var cloudCover: NSString
        var humidity: NSString
        var observation_time: NSString
        var precipMM: NSString
        var pressure: NSString
        var temperature: NSString
        var visibility: NSString
        var weatherCode: NSString
        var weatherDesc: NSString
        var weatherIconImage: UIImage
        var winddir16Point: NSString
        var winddirDegree: NSString
        var windSpeed: NSString
    init() {
        self.cloudCover = ""
        self.humidity = "Humid"
        self.observation_time = ""
        self.precipMM = ""
        self.pressure = ""
        self.temperature = "Temp"
        self.visibility = ""
        self.weatherCode = ""
        self.weatherDesc = "Desc"
        self.weatherIconImage = UIImage(named: "darksky")!
        self.winddir16Point = ""
        self.winddirDegree = ""
        self.windSpeed = ""
    }
    func setLabelData (img: UIImageView!, desc: UILabel!, temp: UILabel!, humid: UILabel!) {
        img.image = self.weatherIconImage
        desc.text = self.weatherDesc as String
        temp.text = self.temperature as String
        humid.text = self.humidity as String
    }
    func getWeatherData (completionWithSuccess: @escaping (()->Void)) {
        Alamofire.request("http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json").responseJSON { response in
            switch response.result {
            case .success:
                //JSON     //data
                let json = response.result.value as! NSDictionary
                let data = json.value(forKey: "data") as! NSDictionary
                
                //current_condition vvvvv vvvvv vvvvv vvvvv vvvvv vvvvv
                let current_condition = data.value(forKey: "current_condition") as! NSArray
                let current_condition_FirstElement = current_condition.object(at: 0) as! NSDictionary
                
                self.cloudCover = current_condition_FirstElement.value(forKey: "cloudcover") as! NSString
                self.humidity = current_condition_FirstElement.value(forKey: "humidity") as! NSString
                self.observation_time = current_condition_FirstElement.value(forKey: "observation_time") as! NSString
                self.precipMM = current_condition_FirstElement.value(forKey: "precipMM") as! NSString
                self.pressure = current_condition_FirstElement.value(forKey: "pressure") as! NSString
                
                let temp_C = current_condition_FirstElement.value(forKey: "temp_C") as! NSString
                let temp_F = current_condition_FirstElement.value(forKey: "temp_F") as! NSString
                self.temperature = temp_C
                
                self.visibility = current_condition_FirstElement.value(forKey: "visibility") as! NSString
                self.weatherCode = current_condition_FirstElement.value(forKey: "weatherCode") as! NSString
                
                let weatherDesc_Arr = current_condition_FirstElement.value(forKey: "weatherDesc") as! NSArray
                let weatherDesc_Dic = weatherDesc_Arr.object(at: 0) as! NSDictionary
                self.weatherDesc = weatherDesc_Dic.value(forKey: "value") as! NSString
                
                let weatherIConUrl_Arr = current_condition_FirstElement.value(forKey: "weatherIconUrl") as! NSArray
                let weatherIconUrl_Dic = weatherIConUrl_Arr.object(at: 0) as! NSDictionary
                let weatherIconUrl = weatherIconUrl_Dic.value(forKey: "value") as! NSString
                self.weatherIconImage = UIImage.showImageByUrl(urlBaseString: weatherIconUrl as String)
                    //.showImageByUrl(urlBaseString: weatherIconUrl as String)               //showImageByUrl(urlBaseString: weatherIconUrl as String)
                
                self.winddir16Point = current_condition_FirstElement.value(forKey: "winddir16Point") as! NSString
                self.winddirDegree = current_condition_FirstElement.value(forKey: "winddirDegree") as! NSString
                
                let windspeedKmph = current_condition_FirstElement.value(forKey: "windspeedKmph") as! NSString
                let windspeedMiles = current_condition_FirstElement.value(forKey: "windspeedMiles") as! NSString
                self.windSpeed = windspeedKmph
                
                //request vvvvv vvvvv vvvvv vvvvv vvvvv vvvvv
//                let req = data.value(forKey: "request") as! NSArray
//                let req_FirstElement = req.object(at: 0) as! NSDictionary
//                
//                let query = req_FirstElement.value(forKey: "query") as! NSString
//                let type = req_FirstElement.value(forKey: "type") as! NSString
                
                //weather vvvvv vvvvv vvvvv vvvvv vvvvv vvvvv
//                let weather = data.value(forKey: "weather") as! NSArray
//                var weatherObjectIndex: Int = 0
//                let weather_First_Element = weather.object(at: weatherObjectIndex) as! NSDictionary
//                
//                let date = weather_First_Element.value(forKey: "date") as! NSString
//                let precipMM_weather = weather_First_Element.value(forKey: "precipMM") as! NSString
//                let tempMaxC = weather_First_Element.value(forKey: "tempMaxC") as! NSString
//                let tempMaxF = weather_First_Element.value(forKey: "tempMaxF") as! NSString
//                let tempMinC = weather_First_Element.value(forKey: "tempMinC") as! NSString
//                let tempMinF = weather_First_Element.value(forKey: "tempMinF") as! NSString
//                let weatherCode_weather = weather_First_Element.value(forKey: "weatherCode") as! NSString
//                let weatherDesc_weather_Arr = weather_First_Element.value(forKey: "weatherDesc") as! NSArray
//                let weatherDesc_weather = weatherDesc_weather_Arr.object(at: 0) as! NSDictionary
//                let weatherDesc_weather_value = weatherDesc_weather.value(forKey: "value") as! String
//                let weatherIconUrl_weather_Arr = weather_First_Element.value(forKey: "weatherDesc") as! NSArray
//                let weatherIconUrl_weather = weatherIconUrl_weather_Arr.object(at: 0) as! NSDictionary
//                let weatherIconUrl_weather_value = weatherIconUrl_weather.value(forKey: "value") as! String
//                let winddir16Point_weather = weather_First_Element.value(forKey: "winddir16Point") as! NSString
//                let winddirDegree_weather = weather_First_Element.value(forKey: "winddirDegree") as! NSString
//                let windspeedKmph_weather = weather_First_Element.value(forKey: "windspeedKmph") as! NSString
//                let windspeedMiles_weather = weather_First_Element.value(forKey: "windspeedMiles") as! NSString
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
