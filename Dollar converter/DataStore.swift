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
    var GBN = 0.0
    // EU Euro (EUR)
    var EUR = 0.0
    // Japan Yen - (JPY)
    var JPY = 0.0
    // Brazil Reais - (BRL)
    var BRL = 0.0
    
    func getCurrency(completion: @escaping () -> ()) {
        
        // get data from API and inits currency objects
        USDCurrencyAPI.getUSDCurrency { (data) in
            if let ratesDictionary = data["rates"] as? NSDictionary {
                self.GBN = ratesDictionary["BGN"] as! Double
                self.EUR = ratesDictionary["EUR"] as! Double
                self.JPY = ratesDictionary["JPY"] as! Double
                self.BRL = ratesDictionary["BRL"] as! Double
            }
            completion()
        }
        
    }
}
