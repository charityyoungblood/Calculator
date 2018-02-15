//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Charity Youngblood  on 2/12/18.
//  Copyright © 2018 Charity Youngblood . All rights reserved.
//

import Foundation // as the Model is UI Independent DO NOT import UI Kit in the Model 

// When building a Model - think about the properties your Model should have
// In the case of the calculator - operation type?
// This class should hold all of the functions for operating the calculator

class CalculatorBrain {
    
    private var accumulator = 0.0 // When you set a variable to . something (0.0, 0.5), Swift will infer that value is of data type "Double"
    
    func setOperand(operand: Double) {
        accumulator = operand
        
    }
    
    // As we are creating this code, think about WHAT types of operations we need in our calculator - they boil down to four
    //
    // Notice that each of the operations are very similar, the only thing that would be changing are the characters included (i.e. sqrt or pi)
    // if we had to add every case for every operation, this would get very tedious and our code would not be "DRY"
    // instead, we will create a table, which will include the "operation type" - which will inlcude "generic constants", "generic unary operation", "generic binary operation" - and we will look into the table to decide what to do
    // this table will be a Dictionary
    
    var operations: Dictionary<String,Double>  = [// here we create the Dictionary with types String, as the "key" and Double as the "value"
        "π" : .pi,
        "e" : M_E,
        "√" : sqrt(<#T##Double#>) // square root function - in order to make this work, we have to declare a new type "enum"
        
        ]
    //***REMEMBER: a CONSTANT is a value that DOES NOT change. So since "pi" is always 3.14..., we can set this as a constant
    // Same with "e", "cos", etc.***
    
    enum Operation {// an enum is a discrete set of values 
        
    }
    
    func performOperation(symbol: String) { // this function will operate on the operand
        // the symbol parameter is the String data type of the mathematical symbol
        if let constant = operations[symbol] {
            accumulator = constant // since the Dictionary MAY NOT contain a key of Double, we have to unwrap the Optional Double
            
        }
        //  Previous code below using switch statement
        //        switch symbol {
        //        case "π": accumulator = .pi
        //        case "√": accumulator = sqrt(accumulator)
        //        case "+": accumulator =  // what user typed into display + what user typed into display
        //         default: break
        // when using a switch statement, you have to consider EVERY value
        // to do this, we need to add a "default" so that after the cases we want to consider have been completed, the program will stop
    }
    
    
    var result: Double { // since this value is set "internally", i.e. you don't want the user to set the result, we can implement ONLY the "get" portion of the computed property
        // Setting ONLY the "get" portion of the computed property makes this a "Read-Only" property
        get {
            return accumulator
        }
        
    }
}
