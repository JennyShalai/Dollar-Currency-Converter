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
    var currentInput = 1
    let maxInput = 999999999999999

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTextField()
        self.initLabels()
        DataStore.store.getCurrency(completion: {
            self.initCurrency()
            // work with UI on main queue
            DispatchQueue.main.async {
                self.updateLabels(amout: 1.0)
            }
        })
    }
    
    func initTextField() {
        // present only numeral keyboard for input
        USDInputTextField.delegate = self
        USDInputTextField.keyboardType = UIKeyboardType.numberPad
        
        // shrink font to fit
        USDInputTextField.adjustsFontSizeToFitWidth = true
        
        // when tapped outside the keyboard - close keyboard
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(ViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    func initCurrency() {
        self.GBP = DataStore.store.GBP
        self.EUR = DataStore.store.EUR
        self.JPY = DataStore.store.JPY
        self.BRL = DataStore.store.BRL
        self.date = DataStore.store.date
    }
    
    func initLabels() {
        self.BRLLabel.adjustsFontSizeToFitWidth = true
        self.EURLabel.adjustsFontSizeToFitWidth = true
        self.JPYLabel.adjustsFontSizeToFitWidth = true
        self.GBPLabel.adjustsFontSizeToFitWidth = true
    }
    
    func updateLabels(amout: Double) {
        self.GBPLabel.text = String(self.GBP * amout)
        self.EURLabel.text = String(self.EUR * amout)
        self.JPYLabel.text = String(self.JPY * amout)
        self.BRLLabel.text = String(self.BRL * amout)
        self.dateLabel.text = self.date
     }
    
    func didTapView() {
        self.view.endEditing(true)
    }
    
    @IBAction func USDInputEdited(_ sender: AnyObject) {
        
        if let input = Int(self.USDInputTextField.text!) {
            self.currentInput = input
            self.validation()
        } else {
            self.currentInput = 0
            self.updateLabels(amout: 0.0)
        }
        
        
    }
    
    func validation() {
        
        
        if self.currentInput == 0 {
            self.USDInputTextField.text = ""
        } else if self.currentInput > self.maxInput {
            USDInputTextField.deleteBackward()
        } else if let USDAmount = Double(self.USDInputTextField.text!) {
            self.updateLabels(amout: USDAmount)
        } else if self.USDInputTextField.text == "" {
            self.updateLabels(amout: 0.0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

