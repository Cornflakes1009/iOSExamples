import UIKit

var total = 0.0
var rate = 0.065
var monthlyInvestment = 1000
var duration = 36

func calculateInterest(durationInMonths: Int, rate: Double, investmentAmount: Double) -> Double {
    for month in 1...durationInMonths {
        total += total * (rate / 12) // 1/12 of the interest rate
        total += investmentAmount
        if month % 12 == 0 {
            print("Total with interest: \(total)")
        }
    }
    return total
}

let interest = calculateInterest(durationInMonths: 360, rate: rate, investmentAmount: Double(monthlyInvestment))
let investment = Double(monthlyInvestment * 120)

print("Investment: \(round(100 * investment) / 100)")
print("Interest: \(round(100 * (interest - investment)) / 100)")
print("Total: \(round(100 * total) / 100)")
