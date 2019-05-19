//
//  CalculatorLogic.swift
//  SwiftyCalc
//
//  Created by Vladimir Korolev on 19/05/2019.
//  Copyright © 2019 VladimirBrejcha. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var inputNumber: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        inputNumber = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        guard let number = inputNumber else {
            fatalError("Input Value for calculate() is nil")
        }
        switch symbol {
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number * 0.01
        case "=":
            return performTwoNumberCalculation(n2: number)
        default:
            intermediateCalculation = (n1: number, calcMethod: symbol)
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
