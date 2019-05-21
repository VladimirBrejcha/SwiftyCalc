//
//  ViewController.swift
//  SwiftyCalc
//
//  Created by Vladimir Korolev on 19/05/2019.
//  Copyright © 2019 VladimirBrejcha. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var isFinishedTyping = true
    
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                return 0
            }
            return number
        }
        set {
            
            let isInt = floor(newValue) == newValue
            
            if !isInt {
                displayLabel.text = String(newValue)
            } else {
                let anValue = String(format: "%.0f", newValue)
                displayLabel.text = anValue
            }
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) { //What should happen when a non-number button is pressed
        
        isFinishedTyping = true
        
        calculator.setNumber(displayValue)
        
        guard let calcMethod = sender.currentTitle else {
            fatalError("Button title doesnt exist")
        }
        
        if let result = calculator.calculate(symbol: calcMethod) {
            displayValue = result
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) { //What should happen when a number is entered into the keypad
        
        guard let numValue = sender.currentTitle else { return }
        
        if isFinishedTyping {
            if numValue == "." {
                displayLabel.text! += numValue
            } else {
                displayLabel.text = numValue
            }
            isFinishedTyping = false
        } else {
            if numValue == "." {
                if displayLabel.text!.contains(".") {
                    return
                }
            }
            displayLabel.text! += numValue
        }
    }
    
}

