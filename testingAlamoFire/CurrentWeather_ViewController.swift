//
//  CurrentWeather_ViewController.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/28/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather_ViewController: UIViewController {
    @IBOutlet weak var imgWeatherIcon: UIImageView!
    @IBOutlet weak var lblWeatherDesc: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblHumid: UILabel!
    
    var currentCondition = CurrentWeather()
    
    @IBAction func btnReload(_ sender: AnyObject) {
//        currentCondition.getWeatherData()
        currentCondition.setLabelData(img: imgWeatherIcon, desc: lblWeatherDesc, temp: lblTemp, humid: lblHumid)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCondition.getWeatherData {
            self.currentCondition.setLabelData(img: self.imgWeatherIcon, desc: self.lblWeatherDesc, temp: self.lblTemp, humid: self.lblHumid)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
