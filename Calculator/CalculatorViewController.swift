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
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        // TODO: Place numbers in display, based on what digits are selected
        let textCurrentlyInDisplay = display.text // this variable will display the current text in the display 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

