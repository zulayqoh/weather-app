//
//  WeatherLoader.swift
//  WeatherApp
//
//  Created by Decagon on 10/08/2021.
//

import Foundation
import UIKit

class WeatherDataLoader {
  
  func pullJSONDataFrom(city: String, forcast: Bool, completionHandler: @escaping (WeatherMain) -> () ) {
   
    let apiKey = "93f913c226b1d5d7afc72bf18f900b0d"
    let urlLink = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
    
    if let url = URL(string: urlLink ){
      
      URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          print("Error : \(error.localizedDescription )")
          fatalError()
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
          print("Error : HTTP Response Error Code")
          return
        }
        
        guard let data = data else {
          print("Error : No Data returned")
          return
        }
        
        if (!forcast){
          do{
            let weatherMain = try? JSONDecoder().decode(WeatherMain.self, from: data)
            if let weatherMain = weatherMain{
              print("Data has been loaded")
              DispatchQueue.main.async {
                completionHandler(weatherMain)
              }
            }
          }
        }
      }.resume()
    }
  }
}
