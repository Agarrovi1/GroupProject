//
//  YearInputViewController.swift
//  GroupProject
//
//  Created by hildy abreu on 9/16/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class YearInputViewController: UIViewController {

    @IBOutlet weak var currentAgeLabel: UILabel!
    
    @IBOutlet weak var currentAgeUserInputTextField: UITextField!
    
    @IBOutlet weak var targetAgeLabel: UILabel!
    
    @IBOutlet weak var targetAgeUserInputTextField: UITextField!
    
    @IBOutlet weak var calculateTotalButton: UIButton!
    
    @IBOutlet weak var calculateMothlyPaymentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let currentAgeUserInputTextField = currentAgeUserInputTextField.text else {return}
    guard currentAgeUserInputTextField != "" else {return}
    guard let current = Int(currentAgeUserInputTextField) else {return}
    
    guard let targetAgeUserInputTextField = targetAgeUserInputTextField.text else {return}
    guard targetAgeUserInputTextField != "" else {return}
    guard let target = Int(targetAgeUserInputTextField) else {return}
    
    switch segue.identifier {
    case "totalSegue":
      guard let destinationVC = segue.destination as? CalculatorViewController else {return}
      destinationVC.lengthOfTime = target - current
      destinationVC.mode = .total
    case "monthlySegue":
      guard let destinationVC = segue.destination as? CalculatorViewController else {return}
      destinationVC.lengthOfTime = target - current
      destinationVC.mode = .monthly
    default:
      fatalError("Unexpected segue identifier")
    }
  }
  
  
  
}

//
//guard let currentAgeUserInputTextField.text < targetAgeUserInputTextField.text else {fatalError("incorrect user input")}
//
//
