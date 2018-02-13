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
