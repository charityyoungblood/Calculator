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
    
    func setOperand(operand: Double) {
        
    }
    
    func performOperation(symbol: String) { // this function will operate on the operand
        // the symbol parameter is the String data type of the mathematical symbol
        
    }
    
    var result: Double { // since this value is set "internally", i.e. you don't want the user to set the result, we can implement ONLY the "get" portion of the computed property
        // Setting ONLY the "get" portion of the computed property makes this a "Read-Only" property
        get {
            return 0.0
        }
        
    }
}
