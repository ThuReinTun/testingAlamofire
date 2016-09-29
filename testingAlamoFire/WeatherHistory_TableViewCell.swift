//
//  weatherhistory_TableViewCell.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/29/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import UIKit

class WeatherHistory_TableViewCell: UITableViewCell {

    @IBOutlet weak var lblWeatherCode: UILabel!
    @IBOutlet weak var imgWeatherIcon: UIImageView!
    @IBOutlet weak var lblWeatherDesc: UILabel!
    @IBOutlet weak var lblObserveTime: UILabel!
    @IBOutlet weak var lblPreceipMM: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblWindDir: UILabel!
    @IBOutlet weak var lblWindDeg: UILabel!
    @IBOutlet weak var lblWindSpeedKm: UILabel!
    @IBOutlet weak var lblWindSpeedMile: UILabel!
    
    @IBOutlet weak var btnShowMore: UIButton!
    
    @IBOutlet weak var weatherTopDeco: WeatherBGView!
    @IBOutlet weak var weatherBotDeco: WeatherBGView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
