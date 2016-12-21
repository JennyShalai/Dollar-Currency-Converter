//
//  USDCurrencyAPI.swift
//  Dollar converter
//
//  Created by Flatiron School on 12/20/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import Foundation

class USDCurrencyAPI {

    class func getUSDCurrency(completionHandler: @escaping (NSDictionary) ->()) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let currencyURL = URL(string: "http://api.fixer.io/latest?base=USD")
        
        let task = session.dataTask(with: currencyURL!) {
            (data, response, error) in
            
            if let data = data {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                    
                    completionHandler(json)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
