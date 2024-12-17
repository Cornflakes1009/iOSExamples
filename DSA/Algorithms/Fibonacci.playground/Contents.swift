import UIKit

func fibonacci(number: Int) {
    var firstNumber = 0
    var secondNumber = 1
    for _ in 1...number {
        let temp = secondNumber
        secondNumber += firstNumber
        firstNumber = temp
        print(secondNumber)
    }
}

fibonacci(number: 20)
