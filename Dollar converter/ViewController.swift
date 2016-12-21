//
//  ViewController.swift
//  Dollar converter
//
//  Created by Flatiron School on 12/20/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var USDInputTextField: UITextField!
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
        self.initTextField()
        DataStore.store.getCurrency(completion: {
            self.initCurrency()
            // work with UI on main queue
            DispatchQueue.main.async {
                self.updateLabels(ammout: 1.0)
            }
        })
    }
    
    func initTextField() {
        USDInputTextField.delegate = self
        USDInputTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    func initCurrency() {
        self.GBP = DataStore.store.GBP
        self.EUR = DataStore.store.EUR
        self.JPY = DataStore.store.JPY
        self.BRL = DataStore.store.BRL
        self.date = DataStore.store.date
    }
    
    func updateLabels(ammout: Double) {
        self.GBPLabel.text = String(self.GBP * ammout)
        self.EURLabel.text = String(self.EUR * ammout)
        self.JPYLabel.text = String(self.JPY * ammout)
        self.BRLLabel.text = String(self.BRL * ammout)
        self.dateLabel.text = self.date
     }
    
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.USDInputTextField.resignFirstResponder()
//        return true
//    }
    
    @IBAction func USDInputEdited(_ sender: AnyObject) {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CHANGED")
        if let USDAmmount = Double(self.USDInputTextField.text!) {
            self.updateLabels(ammout: USDAmmount)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

