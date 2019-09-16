//
//  CalculatorViewController.swift
//  GroupProject
//
//  Created by hildy abreu on 9/16/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    

    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBOutlet weak var LabelOne: UILabel!
    
    
    @IBOutlet weak var LabelTwo: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var percentageStepper: UIStepper!
    @IBAction func interestStepper(_ sender: UIStepper) {
    }
    

    @IBOutlet weak var nextButton: UIButton!
    
    
    
    @IBOutlet weak var calculatorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
