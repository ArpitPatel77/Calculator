//
//  ViewController.swift
//  Arpit_Patel_Green_Calculator
//
//  Created by Arpit Kamalkumar Patel on 2019-09-11.
//  Copyright © 2019 Arpit Kamalkumar Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlites
    @IBOutlet weak var numberDisplay: UITextField!
    var startNewNumber = true
    
    //MARK: Other Variables
    var calculatorModel = Arpit_Calculatr_Model()
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    //MARK: IBActions
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        print("button touched")
        print(sender.currentTitle!)
        
        let buttonText = sender.currentTitle!
        var currentValue = numberDisplay.text!
        
        switch (buttonText) {
            case "0","1","2","3","4","5","6","7","8","9",".": print(buttonText)
            if(startNewNumber){
                if(currentValue == "."){
                    currentValue = "0."
                } else {
                currentValue = buttonText
                }
            } else {
                if(buttonText == "."){
                    if(!currentValue.contains(".")){
                       currentValue = currentValue + buttonText
                    }
                } else {
                    currentValue = currentValue + buttonText
                }
            }
        startNewNumber = false
        calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            //do something
            
        case "+", "-", "X", "/", "%", "^2":
            if (calculatorModel.secondNumber != nil){
                currentValue = String(calculatorModel.getResult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            calculatorModel.operation = buttonText
            startNewNumber = true
            //accept secondNumber after this
        
        case "=":
            //get the result and display
            if(calculatorModel.secondNumber == nil){
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            currentValue = String(calculatorModel.getResult())
            startNewNumber = true
            
        case  "C":
            currentValue = "0"
            calculatorModel.reset()
            startNewNumber = true
        default:
            //do something by default
            print(buttonText)
        }
        numberDisplay.text = currentValue
    }
}

