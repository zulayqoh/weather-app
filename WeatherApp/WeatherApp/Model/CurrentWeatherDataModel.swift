//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Decagon on 10/08/2021.
//

import Foundation
import UIKit



// MARK:- MAIN STRUCT MODEL for current

struct Weather: Codable {
  let main: String
  let description: String
 let humidity: Float
}


// for current

struct WeatherMain: Codable { // MARK:- A STRUCT MODEL OF WHERE WE HAVE WHAT WE WANT
  let main: Main
  let weather: [Weather]
}

struct Main: Codable { // MARK:- CREATING A STRUCT MODEL FOR WHAT WE WANT //main
  let temp: Double
  let temp_min: Double
  let temp_max: Double
}

enum WeatherDescription {
  case Rain
  case Clouds
  case Clear
}
