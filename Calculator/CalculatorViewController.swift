//
//  ViewController.swift
//  Calculator
//
//  Created by Charity Youngblood  on 2/9/18.
//  Copyright © 2018 Charity Youngblood . All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) digit")
   
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

