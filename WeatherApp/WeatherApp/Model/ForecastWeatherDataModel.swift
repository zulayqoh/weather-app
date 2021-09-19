//
//  WeatherForecastWeatherModel.swift
//  WeatherApp
//
//  Created by Decagon on 11/08/2021.
//

import Foundation
import UIKit

struct WeatherData: Decodable {
  let list: [List]
}

// MARK:- LIST STRUCT MODEL OF ALL THE DATA STRUCT MODELS WE HAVE CREATED for forcast

struct List: Decodable {
  let dt: Double
  let main: Mains
  let weather: [WeatherPart]
  
}

// MARK:- WEATHER STRUCT MODEL

struct WeatherPart: Decodable {
 // let main: String
  let main: String
 // let icon: String
}

struct Mains: Decodable {
  let temp: Float
////  let temp_min: Float
////  let temp_max: Float
////  let feels_like: Float
////  let humidity: Float
}
