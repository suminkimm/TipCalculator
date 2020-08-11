//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Su Min Kim on 8/10/20.
//  Copyright © 2020 Su Min Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // set gradient background
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 126/255, green: 210/255, blue: 187/255, alpha: 1.0).cgColor, UIColor(red: 34/255, green: 87/255, blue: 77/255, alpha: 1.0).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        // change segment controller font
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // textfield becomes first responder
        
        DispatchQueue.main.async {
            self.billAmountTextField.becomeFirstResponder()
        }
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let strippedBill = billAmountTextField.text!.replacingOccurrences(of: "$", with: "")
        let bill = Double(strippedBill) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

