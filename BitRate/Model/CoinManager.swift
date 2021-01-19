//
//  AppDelegate.swift
//  BitRate
//
//  Created by Aleksandr Seminov on 18/01/2021.
//  Copyright © 2021 The Aleksandr802. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","UAH","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        
        let urlStringO = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        let urlString = urlStringO.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        performRequest(with: urlString)
        print(urlString)
    }
    
    func performRequest(with urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URL Session
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) {( data, response, error ) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: String.Encoding.utf8)
                    print(dataString)
                }
            }
            //4. Start the task
            task.resume()
        }
    }
}
