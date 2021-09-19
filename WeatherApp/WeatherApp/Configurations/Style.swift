//
//  Style.swift
//  WeatherApp
//
//  Created by Decagon on 12/08/2021.
//

import UIKit


enum AppStyle {
  
  case rainy
  case cloudy
  case clearsky
  
  var icon: UIImage {
    switch self {
    case .rainy:
      return UIImage(named: "Rainy")!
    case .cloudy:
      return UIImage(named: "Cloudy")!
    case .clearsky:
      return UIImage(named: "ClearSky")!
    }
  }
  
  var color: UIColor {
    switch self {
    case .rainy:
      return UIColor(red: 0.34, green: 0.34, blue: 0.36, alpha: 1.00)
    case .cloudy:
      return UIColor(red: 0.33, green: 0.44, blue: 0.48, alpha: 1.00)
    case .clearsky:
      return UIColor(red: 0.28, green: 0.67, blue: 0.18, alpha: 1.00)
    }
  }
}
