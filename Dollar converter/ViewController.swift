//
//  ViewController.swift
//  Dollar converter
//
//  Created by Flatiron School on 12/20/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var GBN = 0.0
    var EUR = 0.0
    var JPY = 0.0
    var BRL = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        DataStore.store.getCurrency(completion: {
            self.initCurrency()
            self.test()
        })
        
        
    }
    
    func initCurrency() {
        self.GBN = DataStore.store.GBN
        self.EUR = DataStore.store.EUR
        self.JPY = DataStore.store.JPY
        self.BRL = DataStore.store.BRL
    }
    
    func test() {
        print(self.GBN)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

