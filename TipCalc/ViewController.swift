//
//  ViewController.swift
//  TipCalc
//
//  Created by Maeve Lynskey on 09/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var customTipPercentLabel1: UILabel!
    @IBOutlet weak var customTipPercentageSlider: UISlider!
    @IBOutlet weak var customTipPercentLabel2: UILabel!
    @IBOutlet weak var tip18Label: UILabel!
    @IBOutlet weak var total18Label: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tip15Label: UILabel!
    @IBOutlet weak var total15Label: UILabel!
    let decimal100 = NSDecimalNumber(string: "100.0")
    let decimal15percent = NSDecimalNumber(string: "0.15")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        
    }
    
    
}

