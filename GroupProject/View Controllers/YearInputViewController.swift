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
