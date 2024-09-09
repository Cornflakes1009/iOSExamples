import UIKit

// UInt is a non-negative integer (unsigned integer)
func factorialOfValue(value: UInt) -> UInt {
    if value == 0 { return 1 } // the factorial of 0 is 1
    var product: UInt = 1
    for i in 1...value {
        product = product * i
    }
    return product
}

print(factorialOfValue(value: 3))

func recursiveFactorial(value: UInt) -> UInt {
    if value == 0 { return 1 } // the factorial of 0 is 1. This stops the function from calling itself.
    return value * recursiveFactorial(value: value - 1)
}
recursiveFactorial(value: 7)
