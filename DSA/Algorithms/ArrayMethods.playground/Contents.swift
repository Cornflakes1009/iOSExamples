import UIKit

struct Device {
    var type: String
    var price: Double
    var color: String
}

var iPhone7Plus = Device(type: "iPhone", price: 920.0, color: "Silver")
var iPhone12    = Device(type: "iPhone", price: 940.0, color: "White")
var macBookPro  = Device(type: "Mac", price: 2400.0, color: "Silver")
var appleWatch  = Device(type: "Apple Watch", price: 150, color: "Black")

let myAppleDevices = [iPhone7Plus, iPhone12, macBookPro, appleWatch]

// MARK: - Filter - filters out all values that don't match
let iPhones = myAppleDevices.filter({ return $0.type == "iPhone"})

// MARK: - Map - does something for each value
let canadianPrices: [Double] = myAppleDevices.map({ return $0.price * 1.2 })

// MARK: - Reduce - Compiles all values into 1 value (0.0, is the starting value. Could be a variable instead.
let totalCanadianPrice: Double = canadianPrices.reduce(0.0, +)
print(totalCanadianPrice)


