//
//  Arpit_Calculatr_Model.swift
//  Arpit_Patel_Green_Calculator
//
//  Created by Arpit Kamalkumar Patel on 2019-09-11.
//  Copyright © 2019 Arpit Kamalkumar Patel. All rights reserved.
//

import Foundation

class Arpit_Calculatr_Model {
    var firstNumber: Double?
    var secondNumber: Double?
    var operation: String?
    
    func updateNumber(newNumber: Double) {
        if(firstNumber == nil){
            firstNumber = newNumber
        } else if (operation == nil){
            firstNumber = newNumber
        } else {
            secondNumber = newNumber
        }
    }
    func getResult() -> Double {
        var result: Double
        switch (operation) {
        case "+":
            result = firstNumber! + secondNumber!
        case "-":
            result = firstNumber! - secondNumber!
        case "X":
            result = firstNumber! * secondNumber!
        case "/":
            result = firstNumber! / secondNumber!
        case "%":
            result = (firstNumber! - secondNumber!) / firstNumber!
        case "^2":
            result = firstNumber! * firstNumber!
        default:
            result = 0.0
        }
         return result
    }
    
    func reset() {
        firstNumber = nil
        operation = nil
        secondNumber = nil
    }
}
