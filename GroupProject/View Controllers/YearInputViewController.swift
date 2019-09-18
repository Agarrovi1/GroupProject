//
//  YearInputViewController.swift
//  GroupProject
//
//  Created by hildy abreu on 9/16/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit
import AVFoundation

class YearInputViewController: UIViewController {

    @IBOutlet weak var currentAgeLabel: UILabel!
    
    @IBOutlet weak var currentAgeUserInputTextField: UITextField!
    
    @IBOutlet weak var targetAgeLabel: UILabel!
    
    @IBOutlet weak var targetAgeUserInputTextField: UITextField!
    
    @IBOutlet weak var calculateTotalButton: UIButton!
    
    @IBOutlet weak var calculateMothlyPaymentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      currentAgeUserInputTextField.delegate = self
//      targetAgeUserInputTextField.delegate = self
//      calculateTotalButton.isEnabled = false
//      calculateMothlyPaymentButton.isEnabled = false
      
    }
  var player: AVAudioPlayer!

  func playSound() {
    let url = Bundle.main.url(forResource: "Cash", withExtension: "mp3")!
    do {
      player = try AVAudioPlayer(contentsOf: url)
      guard let player = player else { return }
      
    } catch let error as Error {
      print(error)
    }
    player.play()
  }
  
  
//func checkInputs() {
//  if let currentAgeUserInputTextField = currentAgeUserInputTextField.text, currentAgeUserInputTextField != "", let currentAge = Int(currentAgeUserInputTextField), let targetAgeUserInputTextField = targetAgeUserInputTextField.text, targetAgeUserInputTextField != "", let targetAge = Int(targetAgeUserInputTextField) {
//    if targetAge - currentAge > 0 {
//      calculateTotalButton.isEnabled = true
//      calculateMothlyPaymentButton.isEnabled = true
//      resignFirstResponder()
//    }
//  }
//}
  
  
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
      playSound()
    
    case "monthlySegue":
      guard let destinationVC = segue.destination as? CalculatorViewController else {return}
      destinationVC.lengthOfTime = target - current
      destinationVC.mode = .monthly
      playSound()
    default:
      fatalError("Unexpected segue identifier")
    }
  }
}


//extension YearInputViewController: UITextFieldDelegate {
//  func textFieldDidBeginEditing(_ textField: UITextField) {
//    checkInputs()
//  }
//
//}

