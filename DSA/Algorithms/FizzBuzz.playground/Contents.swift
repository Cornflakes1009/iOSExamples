import UIKit

enum FizzBuzzType: String {
    case FizzBuzz
    case fizz = "Fizz"
    case buzz = "Buzz"
}

func fizz(n: Int) -> Bool {
    if n % 3 == 0 {
        print(FizzBuzzType.fizz.rawValue)
        return true
    } else {
        return false
    }
}

func buzz(n: Int) -> Bool {
    if n % 5 == 0 {
        print(FizzBuzzType.buzz.rawValue)
        return true
    } else {
        return false
    }
}

func fizzB(n: Int) -> Bool {
    if n % 5 == 0 && n % 3 == 0 {
        print(FizzBuzzType.FizzBuzz.rawValue)
        return true
    } else {
        return false
    }
}

func fizzBuzz(number: Int) {
    for i in 1...number {
        if fizzB(n: i) {
        } else if buzz(n: i) {
        } else if fizz(n: i) {
        } else {
            print(i)
        }
    }
}

fizzBuzz(number: 63)

//func fizzBuzz(number: Int) {
//    for i in 1...number {
//        if i % 5 == 0 && i % 3 == 0 {
//            print("FizzBuzz")
//        } else if i % 5 == 0 {
//            print("Fizz")
//        } else if i % 3 == 0 {
//            print("Buzz")
//        } else {
//            print(i)
//        }
//    }
//}
