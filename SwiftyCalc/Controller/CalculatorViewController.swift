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
                fatalError("Could not convert string into a double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
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
            displayLabel.text = numValue
            isFinishedTyping = false
        } else {
            
            let isInt = floor(displayValue) == displayValue
            
            if !isInt {
                return
            }
            
            displayLabel.text! += numValue
        }
    }
    
}

