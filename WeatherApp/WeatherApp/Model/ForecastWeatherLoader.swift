//
//  ForecastWeatherLoader.swift
//  WeatherApp
//
//  Created by Decagon on 11/08/2021.
//

import Foundation
import UIKit

class WeatherForcastLoader {
  
  func pullJSONDataFrom(city: String, forcast: Bool, completionHandler: @escaping (WeatherData) -> () ) {
    let apiKey = "93f913c226b1d5d7afc72bf18f900b0d"
    let urlLink = "https://api.openweathermap.org/data/2.5/forecast?q=\(city),ng&appid=\(apiKey)&units=metric"
    
    if let url = URL(string: urlLink ){
      
      URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          print("Error : \(error.localizedDescription )")
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
          print("Error : HTTP Response Error Code")
          return
        }
        
        guard let data = data else {
          print("Error : No Response")
          return
        }
        
        if (forcast){
          do{
            let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data)
            if let weatherData = weatherData{
              print("Data has been loaded")
              DispatchQueue.main.async {
                completionHandler(weatherData)
              }
            }
          }
        }
      }.resume()
    }
  }
}

