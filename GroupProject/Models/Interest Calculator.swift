//
//  Interest Calculator.swift
//  GroupProject
//
//  Created by Angela Garrovillas on 9/16/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct InterestCalculator {
    var goal: Double
    var interestRate: Double
    var numOfYears: Int
    var total: Double = 0
    var monthlyDeposits: Double
    
    static let defaultCalc = InterestCalculator(goal: Double(), interestRate: Double(), numOfYears: Int(), total: Double(), monthlyDeposits: Double())
    
    static func calculateFromGoal(goal: Double, interestRate: Double, numOfYear: Int) -> InterestCalculator {
        let power = pow((1 + (interestRate / 12)), Double(12 * numOfYear))
        let monthly = power / goal * 12 * Double(numOfYear)
        return InterestCalculator(goal: goal, interestRate: interestRate, numOfYears: numOfYear, total: 0, monthlyDeposits: monthly)
    }
    static func calculateFromMonthly(monthly: Double, interestRate: Double, numOfYear: Int) -> InterestCalculator {
        let power = pow((1 + (interestRate / 12)), Double(12 * numOfYear))
        let goal = Double(numOfYear) * monthly * 12 * power
        return InterestCalculator(goal: goal, interestRate: interestRate, numOfYears: numOfYear, total: 0, monthlyDeposits: monthly)
    }
    
    
    mutating func makeAsArray() -> [(year: Int,totalInterest: Double, balance: Double)] {
        total = 0
        var newArr = [(year: Int,totalInterest: Double, balance: Double)]()
        for year in 1...numOfYears {
            let power = pow((1 + interestRate / 12), 12)
            total += (monthlyDeposits * 12) * power
            let totalInterest = total - (monthlyDeposits * Double(12 * year))
            let tuple = (year: year, totalInterest: totalInterest, balance: total)
            newArr.append(tuple)
        }
        return newArr
    }
}
