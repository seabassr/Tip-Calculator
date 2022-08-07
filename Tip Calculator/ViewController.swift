//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Sebastian Rodriguez on 7/29/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sliderValue: UITextField!
    @IBOutlet weak var tipAmount: UISlider!
    @IBOutlet weak var payAmount: UITextField!
    @IBOutlet weak var splitAmount: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.text = "0"
        sliderValue.text = "15%"
        payAmount.text = "0"
    }
    
    @IBAction func calculateSlider(_ sender: Any) {
        calculate()
    }
    
    @IBAction func calculateSplit(_ sender: Any) {
        calculate()
    }
    
    func calculate() {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let splitValue = [1, 2, 3, 4, 5]
        let tipPercentage = Int(tipAmount.value)
        let tip = bill * (Double(tipPercentage) / 100.0)
        let total = bill + tip
        let each = total / Double(splitValue[splitAmount.selectedSegmentIndex])
        
        // Update slider label
        sliderValue.text = String(format: "%d%%", tipPercentage)
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        // Update each pay
        payAmount.text = String(format: "$%.2f", each)
    }
}

