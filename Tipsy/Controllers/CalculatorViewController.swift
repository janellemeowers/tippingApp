//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.15
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var fifteenPctButton: UIButton!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitNumber = 2
    var billTotal = 0.0
    var youPay = "0.0"
   

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        fifteenPctButton.isSelected = false
        
        //dismiss keyboard when done
        billTextField.endEditing(true)
        
    
    let percentString = sender.currentTitle!
        
        sender.isSelected = true
        
    //Remove the last character (%) from the title then turn it back into a String.
    let tipMinusPercentSign =  String(percentString.dropLast())
        
    //Turn the String into a Double (decimal).
    let tipTitleAsNumber = Double(tipMinusPercentSign)!
        
    //number to decimal
        tip = tipTitleAsNumber / 100
    }
   
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //update text, sender.value
                splitNumberLabel.text = String(format: "%.0f", sender.value)
        //update property, as whole number
        
        splitNumber = Int(sender.value)
        
        
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
       
        let billString = billTextField.text!
        
        //if billstring isn't empty
        if billString != "" {
            
            //convert to 2 dec
            billTotal = Double(billString)!
            
            //change to double to work
    let result = billTotal * (1 + tip) / Double(splitNumber)
       
        //turn into string, 2 dec
      let resultString = String(format: "%.2f", result)
            
            youPay = resultString
        
        }
        //This line triggers the segue to happen.
                self.performSegue(withIdentifier: "calculateSegue", sender: self)
        
    }
        
        //copy from second segue. specify data type
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check for other segues
        if segue.identifier == "calculateSegue" {
       // data type UI VIEW CONTROLLER
        // forced downcast, destination view controller
        let destinationVC =  segue.destination as! ResultsViewController
        //send over amount
            destinationVC.billPp = youPay
            destinationVC.tip = Int(tip*100)
                destinationVC.people = splitNumber
        
        
        
        
    }
        
    }
}

