//
//  WeatherData-forecast.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/28/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class HistoryWeather {
    var weatherIconImage : UIImage
    var date : NSString
    var precipMM : NSString
    var tempMaxC : NSString
    var tempMaxF : NSString
    var tempMinC : NSString
    var tempMinF : NSString
    var weatherCode : NSString
    var weatherDesc : NSString
    var weatherIconUrl : NSString
    var winddir16Point : NSString
    var winddirDegree : NSString
    var winddirection : NSString
    var windspeedKmph : NSString
    var windspeedMiles : NSString
    
    init() {
        weatherIconImage = UIImage(named: "placeholder")!
        self.date = ""
        self.precipMM = ""
        self.tempMaxC = ""
        self.tempMaxF = ""
        self.tempMinC = ""
        self.tempMinF = ""
        self.weatherCode = ""
        self.weatherDesc = ""
        self.weatherIconUrl = ""
        self.winddir16Point = ""
        self.winddirDegree = ""
        self.winddirection = ""
        self.windspeedKmph = ""
        self.windspeedMiles = ""
    }
    
    func setLabelData (weatherIcon: UIImageView, weatherCode: UILabel, weatherDesc: UILabel, observeTime: UILabel, precipMM: UILabel, temperature: UILabel, winddir: UILabel, winddeg: UILabel, windspeedKmph: UILabel, windspeedMph: UILabel) {
        
        weatherIcon.image = self.weatherIconImage
        weatherCode.text = "Weather Code : \(self.weatherCode as String)"
        weatherDesc.text = self.weatherDesc as String
        observeTime.text = self.date as String
        precipMM.text = self.precipMM as String
        temperature.text = "\(self.tempMinF as String) / \(self.tempMaxF as String)"
        winddir.text = self.winddir16Point as String
        winddeg.text = self.winddirDegree as String
        windspeedKmph.text = self.windspeedKmph as String
        windspeedMph.text = self.windspeedMiles as String
    }
    
    func getWeatherData (completionWithSuccess: @escaping (()->Void), weatherObjIndex: Int) {
        Alamofire.request("http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json").responseJSON { response in
            switch response.result {
            case .success:
                //JSON     //data
                let json = response.result.value as! NSDictionary
                let data = json.value(forKey: "data") as! NSDictionary
                
                //weather vvvvv vvvvv vvvvv vvvvv vvvvv vvvvv
                                let weather = data.value(forKey: "weather") as! NSArray
                                let weather_First_Element = weather.object(at: weatherObjIndex) as! NSDictionary
                
                                self.date = weather_First_Element.value(forKey: "date") as! NSString
                                self.precipMM = weather_First_Element.value(forKey: "precipMM") as! NSString
                                self.tempMaxC = weather_First_Element.value(forKey: "tempMaxC") as! NSString
                                self.tempMaxF = weather_First_Element.value(forKey: "tempMaxF") as! NSString
                                self.tempMinC = weather_First_Element.value(forKey: "tempMinC") as! NSString
                                self.tempMinF = weather_First_Element.value(forKey: "tempMinF") as! NSString
                                self.weatherCode = weather_First_Element.value(forKey: "weatherCode") as! NSString
                                let weatherDesc_Arr = weather_First_Element.value(forKey: "weatherDesc") as! NSArray
                                let weatherDesc_Dic = weatherDesc_Arr.object(at: 0) as! NSDictionary
                                self.weatherDesc = weatherDesc_Dic.value(forKey: "value") as! NSString
                                let weatherIconUrl_Arr = weather_First_Element.value(forKey: "weatherIconUrl") as! NSArray
                                let weatherIconUrl_Dic = weatherIconUrl_Arr.object(at: 0) as! NSDictionary
                                self.weatherIconUrl = weatherIconUrl_Dic.value(forKey: "value") as! NSString
                                self.weatherIconImage = UIImage.showImageByUrl(urlBaseString: self.weatherIconUrl as String)
                
                                self.winddir16Point = weather_First_Element.value(forKey: "winddir16Point") as! NSString
                                self.winddirDegree = weather_First_Element.value(forKey: "winddirDegree") as! NSString
                                self.windspeedKmph = weather_First_Element.value(forKey: "windspeedKmph") as! NSString
                                self.windspeedMiles = weather_First_Element.value(forKey: "windspeedMiles") as! NSString
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
