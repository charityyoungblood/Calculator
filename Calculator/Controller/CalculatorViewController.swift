//
//  ViewController.swift
//  Calculator
//
//  Created by Charity Youngblood  on 2/9/18.
//  Copyright © 2018 Charity Youngblood . All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var display: UILabel! // this represents a property on the CalculatorViewController or an instance variable
    
    var userIsInTheMiddleOfTyping: Bool = false // **REMEMBER: ALL properties/varaibles that are initialized in Swift HAVE to have an INITIAL VALUE** - if you create a variable and don't set it to any value, you will get an error
    
    @IBAction func touchDigit(_ sender: UIButton) {
       
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping { // if the user IS in the middle of typing, set the display text to the constant "textCurrentlyInDisplay" > then update the display text to the value of textCurrentlyInDisplay + digit pressed
        // TODO: Place numbers in display, based on what digits are selected
            let textCurrentlyInDisplay = display.text! // this variable will display the current text in the display
            display.text! = textCurrentlyInDisplay + digit // to concatenate string data types, you can use the + sign
        // **If you wanted to set the Optional to "not set" you would set the value to "nil
            // Ex: display.text = nil
        }
        else {
            display.text! = digit // if the user is NOT in the middle of typing, update the display text to show the digit, which was pressed
        }
        userIsInTheMiddleOfTyping = true // this may need to be changed - if you DON'T include this line, the calculator will ONLY display the digit, not the "collection of digits pressed
            // i.e. WITH this line, the display reads 76854
            // WITHOUT this line, the display reads 4, then deletes the 4 to show 5, then deletes the 5 to show 6 -- i.e. ONLY shows ONE NUMBER at a time 
    }
    // *** REMEMEBER: When creating the methods for your code, think about how to simplify, always making your code D.R.Y
    // In the case of type converting every operation to a String, this would not be effective as you would have to change it back to a Double to operate on the value
    // Since the value that is displayed on the calculator will ALWAYS be a Double, we can create a variable that automatically tracked what was in the display
    // Instead of creating a "storing" variable, we will create a "calculated" variable -- also known as a "Computed Property"
    // Instead of using = to set the variable, we place curly braces after the variable name and data type
    // Inside the curly brackets, place code to calculate the value when we "get" the value and when we "set" the value
    
    var displayValue: Double { // this is an example of a "Computed Property/Variable"
        get {
           return Double(display.text!)! // when we "get" or request the value of displayValue, we want to receieve(return) the display.text with the Double data type
        }
        set {
           display.text = String(newValue) // when we "set" the value of displayValue, we want to set it to newValue with the String data type 
        }
    }
    
    @IBAction func piOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        
        if let mathematicalSymbol = sender.currentTitle {// this is read: "If I can let mathematicalSymbol equal the sender(UIButton)'s current title then I'm going to
        // you want to force unwrap only if UIButton is "set", meaning it's not "nil"
            if mathematicalSymbol == "π" {
                display.text = String(Double.pi) // to convert the type for M_PI, which is Double, to String type - use String keyword and wrap value (M_PI) in parentheses
        }
        
    }
    }
   
// ** How do I change corner radius of all buttons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

