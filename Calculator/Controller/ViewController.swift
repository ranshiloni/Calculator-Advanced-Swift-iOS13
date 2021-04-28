//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
   
    var isFinishedTypingNumber = true
    
    var displayValue: Double {
        get {
            if displayLabel.text != "."{
                guard let number = Double(displayLabel.text!) else {
                    fatalError("Cannot convert display label text to a Double.")
                }
                return number
            }
            return 0
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {

        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(operator: calcMethod) {
            displayValue = result
        }
        
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
       
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {

                    // this will be true or false based on the eqation
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
        
        
    }

}

