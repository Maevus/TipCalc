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
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tip15Label: UILabel!
    @IBOutlet weak var total15Label: UILabel!
    @IBOutlet weak var tipCustomLabel: UILabel!
    @IBOutlet weak var totalCustomLabel: UILabel!
    let decimal100 = NSDecimalNumber(string: "100.0")
    let decimal15percent = NSDecimalNumber(string: "0.15")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        let sliderValue = NSDecimalNumber(value: Int(customTipPercentageSlider.value) as Int)
        let customPercent = sliderValue / decimal100
        
        if sender is UISlider
        {
            customTipPercentLabel1.text = customPercent.formatAsPercent()
            customTipPercentLabel2.text = customTipPercentLabel1.text
        }
        
        if let inputString = inputTextField.text, !inputString.isEmpty
        {
            let billAmount = NSDecimalNumber(string: inputString) // note removed divide by decimal as seemed counterintuitive.
            if sender is UITextField
            {
                billAmountLabel.text = " " + billAmount.formatAsCurrency()
                let fifteenTip = billAmount * decimal15percent
                tip15Label.text = fifteenTip.formatAsCurrency()
                total15Label.text = (billAmount + fifteenTip).formatAsCurrency()
            }
            let customTip = billAmount * customPercent
            tipCustomLabel.text = customTip.formatAsCurrency()
            totalCustomLabel.text = (billAmount + customTip).formatAsCurrency()
        }
        else
        {
            billAmountLabel.text = ""
            tip15Label.text = ""
            total15Label.text = ""
            tipCustomLabel.text = ""
            totalCustomLabel.text = ""
        }
    }
}

extension NSNumber
{
    func formatAsCurrency() -> String {
        return NumberFormatter.localizedString(from: self, number: .currency)
    }
    
    func formatAsPercent() -> String {
        return NumberFormatter.localizedString(from: self, number: .percent)
    }
}

// Global functions for overloaded operands
func +(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.adding(right)
}

func *(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.multiplying(by: right)
}

func /(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.dividing(by: right)
}
