//
//  ViewController.swift
//  WeatherApp
//
//  Created by Decagon on 09/08/2021.
//

import UIKit

class WeatherViewController: UIViewController {
  
  var currentLoader = WeatherDataLoader()
  var currentWeatherData: WeatherMain?
  var forecastLoader = WeatherForcastLoader()
  var forecastWeatherData: WeatherData?
  
  @IBOutlet weak var currentTemperature: UILabel!
  @IBOutlet weak var currentDescription: UILabel!
  @IBOutlet weak var minimumTemperatureLabel: UILabel!
  @IBOutlet weak var currentTemperatureLabel: UILabel!
  @IBOutlet weak var maximumTemperatureLabel: UILabel!
  
  @IBOutlet weak var firstDayForecastLabel: UILabel!
  @IBOutlet weak var secondDayForecastLabel: UILabel!
  @IBOutlet weak var thirdDayForecastLabel: UILabel!
  @IBOutlet weak var fourthDayForecastLabel: UILabel!
  @IBOutlet weak var fifthDayForecastLabel: UILabel!
  
  @IBOutlet weak var firstForecastIconImage: UIImageView!
  @IBOutlet weak var secondForecastIconImage: UIImageView!
  @IBOutlet weak var thirdForecastIconImage: UIImageView!
  @IBOutlet weak var fourthForecastIconImage: UIImageView!
  @IBOutlet weak var fifthForecastIconImage: UIImageView!

  @IBOutlet weak var firstForecastDay: UILabel!
  @IBOutlet weak var secondForecastDay: UILabel!
  @IBOutlet weak var thirdForecastDay: UILabel!
  @IBOutlet weak var fourthForecastDay: UILabel!
  @IBOutlet weak var fifthForecastDay: UILabel!
  
  @IBOutlet weak var currentWeatherImageView: UIImageView!
  @IBOutlet weak var currentWeatherUIView: UIView!
  @IBOutlet var currentWeatherView: UIView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getCurrentWeatherData()
    getForecastWeatherData()
  }
  
  func getCurrentWeatherData() {
    self.currentLoader.pullJSONDataFrom(city: "ibadan", forcast: false) { [self](data) in
      currentWeatherData = data
      
      if let currentWeatherData = currentWeatherData {
        currentTemperature.text = String(Int( currentWeatherData.main.temp )) + "°"
        minimumTemperatureLabel.text = String(Int( currentWeatherData.main.temp_min )) + "°"
        maximumTemperatureLabel.text = String(Int( currentWeatherData.main.temp_max )) + "°"
        currentTemperatureLabel.text = String(Int( currentWeatherData.main.temp )) + "°"
        currentDescription.text = (currentWeatherData.weather[0].main).uppercased()
        
        switch currentDescription.text {
        case "RAIN":
          currentWeatherImageView.image = AppStyle.rainy.icon
          currentWeatherView.backgroundColor = AppStyle.rainy.color
          currentWeatherUIView.backgroundColor = AppStyle.rainy.color
        case "CLOUDS":
          currentWeatherImageView.image = AppStyle.cloudy.icon
          currentWeatherView.backgroundColor = AppStyle.cloudy.color
          currentWeatherUIView.backgroundColor = AppStyle.cloudy.color
        default:
          currentWeatherImageView.image = AppStyle.clearsky.icon
          currentWeatherView.backgroundColor = AppStyle.clearsky.color
          currentWeatherUIView.backgroundColor = AppStyle.clearsky.color
        }
      }
    }
  }
  
  func getForecastWeatherData() {
    self.forecastLoader.pullJSONDataFrom(city: "ibadan", forcast: true) { [self](data) in
      forecastWeatherData = data
      
      if let forecastWeatherData = forecastWeatherData {
        firstDayForecastLabel.text = String(Int(forecastWeatherData.list[0].main.temp)) + "°"
        secondDayForecastLabel.text = String(Int(forecastWeatherData.list[1].main.temp)) + "°"
        thirdDayForecastLabel.text = String(Int(forecastWeatherData.list[2].main.temp)) + "°"
        fourthDayForecastLabel.text = String(Int(forecastWeatherData.list[3].main.temp)) + "°"
        fifthDayForecastLabel.text = String(Int(forecastWeatherData.list[4].main.temp)) + "°"
        
        firstForecastIconImage.image = UIImage(named: forecastWeatherData.list[0].weather[0].main)
        secondForecastIconImage.image = UIImage(named: forecastWeatherData.list[1].weather[0].main)
        thirdForecastIconImage.image = UIImage(named: forecastWeatherData.list[2].weather[0].main)
        fourthForecastIconImage.image = UIImage(named: forecastWeatherData.list[3].weather[0].main)
        fifthForecastIconImage.image = UIImage(named: forecastWeatherData.list[4].weather[0].main)
        
        firstForecastDay.text = getDate(Date(timeIntervalSince1970: Double(((forecastWeatherData.list[0].dt)))))
        secondForecastDay.text = getDate(Date(timeIntervalSince1970: Double(((forecastWeatherData.list[8].dt)))))
        thirdForecastDay.text = getDate(Date(timeIntervalSince1970: Double(((forecastWeatherData.list[16].dt)))))
        fourthForecastDay.text = getDate(Date(timeIntervalSince1970: Double(((forecastWeatherData.list[24].dt)))))
        fifthForecastDay.text = getDate(Date(timeIntervalSince1970: Double(((forecastWeatherData.list[32].dt)))))
      }
    }
  }
  
  private func getDate(_ date: Date?) -> String{
    guard let inputDate = date else {
      return ""
    }
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: inputDate)
  }
}


