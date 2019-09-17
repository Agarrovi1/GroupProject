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
//        updatePercentageLabel()
        makeNewCalculation()
    }
    

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var calculatorTableView: UITableView!
    
    var lengthOfTime: Int?
    var mode = Mode.monthly
    var arrOfCalculations: [(year: Int,totalInterest: Double, balance: Double)] = [] {
        didSet {
            calculatorTableView.reloadData()
        }
    }
    
    func changeLabel() {
        
        switch mode {
        case .monthly:
            LabelOne.text = "Monthly"
            LabelTwo.text = "Total Amount"
        case .total:
            LabelOne.text = "Total Amount"
            LabelTwo.text = "Monthly"
        }
    }
    
    func makeNewCalculation() {
        
        guard let userInputTextField = userInputTextField.text else {return}
        guard userInputTextField != "" else {return}
        guard let value = Double(userInputTextField) else {return}
        guard let time = lengthOfTime else {return}
        
        switch mode {
        case .monthly:
            var calculator = InterestCalculator.calculateFromMonthly(monthly: value, interestRate: percentageStepper.value/100, numOfYear: time)
            arrOfCalculations = calculator.makeAsArray()
            amountLabel.text = "$ \(round(calculator.goal * 100) / 100)"
        case .total:
            var calculator = InterestCalculator.calculateFromGoal(goal: value, interestRate: percentageStepper.value/100, numOfYear: time)
            arrOfCalculations = calculator.makeAsArray()
            amountLabel.text = "$ \(round(calculator.monthlyDeposits * 100) / 100)"
        }
        
        
    }
//    func updatePercentageLabel() {
//        percentageLabel.text = "Rate: \(percentageStepper.value)%"
//    }
//
    func setDelegates() {
        userInputTextField.delegate = self
        calculatorTableView.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        changeLabel()
//        updatePercentageLabel()
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
extension CalculatorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfCalculations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = calculatorTableView.dequeueReusableCell(withIdentifier: "calcCell", for: indexPath) as? calcTableViewCell else {return UITableViewCell()}
        let yearlyCalculation = arrOfCalculations[indexPath.row]
        cell.yearLabel.text = "\(yearlyCalculation.year)"
        cell.interestLabel.text = "\(yearlyCalculation.totalInterest)"
        cell.balanceLabel.text = "\(yearlyCalculation.balance)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Year                      Total Interest              Balance"
    }
}

extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        makeNewCalculation()
        return true
    }
}
