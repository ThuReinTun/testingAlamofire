//
//  WeatherHistory_ViewController.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/29/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import UIKit

class WeatherHistory_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//weatherReportList
    var weatherList = WeatherList()
    var weatherList_Element = HistoryWeather()
    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weatherList.getWeatherListArrIndex { 
            self.weatherTableView.reloadData()
        }
//        weatherList.getWeatherListArrIndex {
//            for index in (0 ..< self.weatherList.weatherTableIndex.count) {
//                self.weatherList_Element.getWeatherData(completionWithSuccess: {
//                    weatherReportList.append(self.weatherList_Element)
//                }, weatherObjIndex: index)
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
////                print("weather description = \(weatherReportList[index].weatherDesc)")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                print("")
//                }
//            self.weatherTableView.reloadData()
//        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        tableView.separatorColor = UIColor.clear
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherList.weatherTableIndex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorColor = UIColor.clear
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherHistoryCell", for: indexPath) as! WeatherHistory_TableViewCell
        
        cell.weatherTopDeco.makeCustomRoundBorders(corners: [.topLeft, .topRight], radius: 20, fillColor: UIColor.clear, borderColor: UIColor.clear, borderWidth: 0)
        cell.weatherBotDeco.makeCustomRoundBorders(corners: [.bottomLeft, .bottomRight], radius: 10, fillColor: UIColor.clear, borderColor: UIColor.clear, borderWidth: 0)
        cell.weatherBotDecoTwo.makeCustomRoundBorders(corners: [.bottomLeft, .bottomRight], radius: 10, fillColor: UIColor.clear, borderColor: UIColor.clear, borderWidth: 0)
        
        cell.weatherTopDeco.backgroundColor = UIColor (red: 200/255, green: 200/255, blue: 200/255, alpha: 0.5)
        cell.weatherBotDeco.backgroundColor = UIColor (red: 150/255, green: 200/255, blue: 200/255, alpha: 0.5)
        cell.weatherBotDecoTwo.backgroundColor = UIColor (red: 150/255, green: 200/255, blue: 200/255, alpha: 0.5)
        
        weatherList_Element.getWeatherData(completionWithSuccess: {
            self.weatherList_Element.setLabelData(weatherIcon: cell.imgWeatherIcon, weatherCode: cell.lblWeatherCode, weatherDesc: cell.lblWeatherDesc, observeTime: cell.lblObserveTime, precipMM: cell.lblPreceipMM, temperature: cell.lblTemp, winddir: cell.lblWindDir, winddeg: cell.lblWindDeg, windspeedKmph: cell.lblWindSpeedKm, windspeedMph: cell.lblWindSpeedMile)
            }, weatherObjIndex: indexPath.row)
        
//        cell.botDecoConstraint.constant = 120
        cell.hideView.isHidden = true
        cell.weatherBotDecoTwo.isHidden = true
        cell.btnShowMore.isHidden = true
        
//        cell.imgWeatherIcon.image = weatherReportList[indexPath.row].weatherIconImage
//        cell.lblWeatherCode.text = weatherReportList[indexPath.row].weatherCode as String
//        cell.lblWeatherDesc.text = weatherReportList[indexPath.row].weatherDesc as String
//        cell.lblObserveTime.text = weatherReportList[indexPath.row].date as String
//        cell.lblPreceipMM.text = weatherReportList[indexPath.row].precipMM as String
//        cell.lblTemp.text = "\(weatherReportList[indexPath.row].tempMinF as String) 'F/\(weatherReportList[indexPath.row].tempMaxF as String) 'F"
//        cell.lblWindDir.text = weatherReportList[indexPath.row].winddir16Point as String
//        cell.lblWindDeg.text = weatherReportList[indexPath.row].winddirDegree as String
//        cell.lblWindSpeedKm.text = weatherReportList[indexPath.row].windspeedKmph as String
//        cell.lblWindSpeedMile.text = weatherReportList[indexPath.row].windspeedMiles as String
        
     return cell
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let temp = indexPath.row
        if (selectedTableCell == temp) {
            selectedTableCell = -1
        }
        else {
            selectedTableCell = temp
        }
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: indexPath) as! WeatherHistory_TableViewCell
        if (selectedTableCell != -1) {
            cell.hideView.isHidden = false
            cell.weatherBotDecoTwo.isHidden = false
        }
        else {
            cell.hideView.isHidden = true
            cell.weatherBotDecoTwo.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (selectedTableCell == indexPath.row) {
//            let cell = tableView.cellForRow(at: indexPath) as! WeatherHistory_TableViewCell
//            cell.botDecoConstraint.constant = 160
            return 210
        }
        return 120
        
        
    }
    
    @IBAction func showMoreInTable(_ sender: AnyObject) {
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
