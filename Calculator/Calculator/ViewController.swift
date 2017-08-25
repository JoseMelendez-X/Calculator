//
//  ViewController.swift
//  Calculator
//
//  Created by Jose Melendez on 8/24/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation: Operator = Operator.nothing
    
    var calcState: CalculationState = CalculationState.enteringNum
    
    var firstValue: String = ""
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //IB-Actions
    
    @IBAction func numberClicked(_ sender: UIButton) {
    
        updateDisplay(number: String(sender.tag))
    
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        
        //When ever we click an operator we want to change our calculator state
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            
            if num != "" {
                
                firstValue = num
                
                //Clear the display when the user clicks an operator
                resultLabel.text = ""
            }
            
        }
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
        case 11:
            currentOperation = Operator.subtract
        case 12:
            currentOperation = Operator.times
        case 13:
            currentOperation = Operator.divide
        default:
            return
        }
        
        
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        
    calculateSum()
        
    }
    
    //Functions
    
    //Update the display every time we click a number
    
    func updateDisplay(number: String){
        
        //Check if we started a new number
        if calcState == CalculationState.newNumStarted {
            
            //Are we able to get something from the label?
            if let num = resultLabel.text {
                
                //If we are able to get something from the label and that something is not blank
                
                if num != "" {
                    
                    //Store num in the fistValue variable
                    firstValue = num
                }
            }
            
            // We are now entering a number
            calcState = CalculationState.enteringNum
            
            //Set the number that was passed to the label
            resultLabel.text = number
        }
        
        else if calcState == CalculationState.enteringNum {
            
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    //Perfom caclulation
    
    func calculateSum() {
        
        if (firstValue.isEmpty) {
            
            return
        }
        
        var result = ""
        
        if currentOperation == Operator.times {
            
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
            
        } else if  currentOperation == Operator.divide{
            
             result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
            
        } else if currentOperation == Operator.add {
            
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
            
        } else if currentOperation == Operator.subtract {
            
             result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        
        calcState = CalculationState.newNumStarted
    }

}

