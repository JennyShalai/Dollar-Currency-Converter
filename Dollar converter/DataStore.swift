//
//  DataStore.swift
//  Dollar converter
//
//  Created by Flatiron School on 12/20/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import Foundation

class DataStore {
    
    static let store = DataStore()
    // UK Pounds (GBP)
    var GBP = 0.0
    // EU Euro (EUR)
    var EUR = 0.0
    // Japan Yen - (JPY)
    var JPY = 0.0
    // Brazil Reais - (BRL)
    var BRL = 0.0
    // date of currency
    var date = ""
    
    func getCurrency(completion: @escaping () -> ()) {
        
        // get data from API and inits currency objects
        USDCurrencyAPI.getUSDCurrency { (data) in
            
            if let date = data["date"] as? String {
                self.date = date
            }
            
            if let ratesDictionary = data["rates"] as? NSDictionary {
                self.GBP = ratesDictionary["GBP"] as! Double
                self.EUR = ratesDictionary["EUR"] as! Double
                self.JPY = ratesDictionary["JPY"] as! Double
                self.BRL = ratesDictionary["BRL"] as! Double
            }
            completion()
        }
        
    }
}
