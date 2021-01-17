//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Егор on 19.12.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipValue: Double?
    var splitNumber: String?
    var value: Double?
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", value ?? "0")
        settingsLabel.text = "Split between \(splitNumber!) people, with \(String(format: "%.0f", tipValue! * 100))% tip"
        print(value)
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
