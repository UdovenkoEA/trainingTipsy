//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipValue = 0.1
    var splitNumber = "2"
    var value = 0.00
    
    @IBOutlet weak var billTextField: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTotal: UITextField!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTotal.endEditing(true)
        
        switch sender.currentTitle {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipValue = 0.0
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipValue = 0.1
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipValue = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = splitNumberLabel.text ?? "Nil"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        value = (Double(billTotal.text ?? "Nil") ?? 0) * (1.0 + tipValue) / Double(splitNumber)!
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.value = value
            destinationVC.splitNumber = splitNumber
            destinationVC.tipValue = tipValue
        }
    }
    
    
    
    
}
