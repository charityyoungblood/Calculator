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
    
    var operations: Dictionary<String,Operation>  = [// here we create the Dictionary with types String, as the "key" and Operation (enum Operation) as the "value"
         // start with creating "key:value" pairs for constants, then create for other operations (+, x, -, etc)
        "π" : Operation.Constant(.pi), // this is setting the value to the enum Operation in the case of Constant
        "√" : Operation.UnaryOperation(sqrt), // square root function - since the sqrt function is not a "Double" value, it is a function, we need something that is going to take a Double and return a Double
        // in order to make the square root operation work, we have to start by declaring a new type "enum"
        "𝗑" : Operation.BinaryOperation({$0 * $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "=" : Operation.Equals
        ]
    //***REMEMBER: a CONSTANT is a value that DOES NOT change. So since "pi" is always 3.14..., we can set this as a constant
    // Same with "e", "cos", etc.***
    
    enum Operation {// an enum has to have a discrete set of values (integer values) - Think about what type of values do you need for your calculator
        // Constant (pi, e, - values that don't change)
        // Unary Operations - negative (Ex: 2 --3)
        // Binary Operations - operators which operate on two values (+, - , *, /, Ex: 1 + 2, or 3 * 5)
        // Equals (Equal sign) Operation
        
        case Constant(Double) // Double is the associated value
        case UnaryOperation((Double) -> Double) // to use a function as an associated value, we have to think about what is the data type going in? The return data type?
        case BinaryOperation((Double, Double) -> Double)
        case Equals // or does it only return a Double?
    }
    
    // In the switch statement, we use the associated value for the case .Constant, instead of Constant(Double) we are replacing the variable with the variable "value" and setting the accumulator to that value
    
    func performNewOperation(symbol: String) { // this function will operate on the operand
        // the symbol parameter is the String data type of the mathematical symbol
         // we use bracket notation to access values in Dictionary
             // since the Dictionary MAY NOT contain a key of Double, we have to unwrap the Optional Double
        if let operation = operations[symbol] { // operation (without capital letter) is a local variable - NOT referring to enum Operation
            switch operation {
            case .Constant(let value): accumulator = value // like in classes, we access the individual case (i.e. case Constant) with dot notation
            case .UnaryOperation(let function): accumulator = function(accumulator) // to use a function as an associated value
            case .BinaryOperation(let function):
                excutePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                excutePendingBinaryOperation()
                }
            }
        }
    
    private func excutePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            // this code is read as: If pending is not equal to nil, we will set the accumulator to pending (which is the Optional for pendingBinaryOperationInfo) - which takes on two variables. We are setting those variables to firstOperand (of type Double) and the second variable as the accumulator
            // now we can set pending to nil, because the operation will no longer be pending
            pending = nil
        }
    }
        //  Previous code below using switch statement
        //        switch symbol {
        //        case "π": accumulator = .pi
        //        case "√": accumulator = sqrt(accumulator)
        //        case "+": accumulator =  // what user typed into display + what user typed into display
        //         default: break
        // when using a switch statement, you have to consider EVERY value
        // to do this, we need to add a "default" so that after the cases we want to consider have been completed, the program will stop
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    
    var result: Double { // since this value is set "internally", i.e. you don't want the user to set the result, we can implement ONLY the "get" portion of the computed property
        // Setting ONLY the "get" portion of the computed property makes this a "Read-Only" property
        get {
            return accumulator
        }
}

}
