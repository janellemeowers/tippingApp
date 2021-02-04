//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by janelle myers on 1/26/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    
   
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billPp = "0.0"
    var tip = 0
    var people = 2
    
  override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = billPp
        settingsLabel.text = "Split between \(people) with \(tip)% tip"
    

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        //method dismisses current view controller
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
