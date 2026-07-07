//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var tipPercentage = 0.1
    var finalAmount: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        stepper.minimumValue = 1
        stepper.maximumValue = 12
        stepper.stepValue = 1

        // Initial value
        stepper.value = 2
        
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        tenPctButton.isSelected = false
        
        sender.isSelected = true
        switch sender.tag {
        case 0:
            tipPercentage = 0.0
        case 10:
            tipPercentage = 0.1
        case 20:
            tipPercentage = 0.2
        default:
            tipPercentage = 0.1
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(stepper.value))"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let numberOfPeople = Int(stepper.value)
        if let billText = billTextField.text,
           let billAmount = Double(billText) {
           let totalWithTip = billAmount + (billAmount * tipPercentage)
            finalAmount = totalWithTip / Double(numberOfPeople)
            performSegue(withIdentifier: "showResult", sender: self)

        } else {
            print("Please enter a valid bill amount")
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if segue.identifier == "showResult" {

                let destinationVC = segue.destination as! ResultsViewController

                destinationVC.result = finalAmount
            }
        }
}

