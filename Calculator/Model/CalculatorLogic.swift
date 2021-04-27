//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ran on 27/04/2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(operator symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            }
        }
        return nil
    }
}
