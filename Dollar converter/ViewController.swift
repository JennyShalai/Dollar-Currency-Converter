//
//  ViewController.swift
//  Dollar converter
//
//  Created by Flatiron School on 12/20/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var EURLabel: UILabel!
    @IBOutlet weak var GBPLabel: UILabel!
    @IBOutlet weak var JPYLabel: UILabel!
    @IBOutlet weak var BRLLabel: UILabel!
    
    var GBP = 0.0
    var EUR = 0.0
    var JPY = 0.0
    var BRL = 0.0
    var date = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        DataStore.store.getCurrency(completion: {
            self.initCurrency()
            DispatchQueue.main.async {
                self.updateLabels()
            }
            
        })
        
        
    }
    
    func initCurrency() {
        self.GBP = DataStore.store.GBP
        self.EUR = DataStore.store.EUR
        self.JPY = DataStore.store.JPY
        self.BRL = DataStore.store.BRL
        self.date = DataStore.store.date
    }
    
    func updateLabels() {
        self.GBPLabel.text = String(self.GBP)
        self.EURLabel.text = String(self.EUR)
        self.JPYLabel.text = String(self.JPY)
        self.BRLLabel.text = String(self.BRL)
        self.dateLabel.text = self.date
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

