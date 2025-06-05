import UIKit
import SwiftUI

// MARK: - Fallthrough and range
var statusCode = 404
var errorString = "The request failed: "

switch statusCode {
case 300..<401:
    errorString += "Invalid error."
case 401, 403, 404:
    errorString += "There was something wrong with the request."
    fallthrough
default:
    errorString += " Please review the request and try again."
}

// MARK: - Value Binding
/// no need for a default case because the last case will always be true.
var statusCode1 = 404
var errorString1 = "The request failed: "

switch statusCode2 {
case 401:
    errorString1 += "Unauthorized."
case 400...417:
    errorString1 += "Client error, \(statusCode)"
case let code:
    errorString1 = "\(code) is not a known error code."
}

// MARK: - Where Clause
/// only setting the value of code is those conditions are being met
var statusCode2 = 404
var errorString2 = "The request failed: "

switch statusCode2 {
case 401:
    errorString2 += "Unauthorized."
case 400...417:
    errorString2 += "Client error, \(statusCode)"
case let code where code < 100 || code >= 600:
    errorString2 = "\(code) is not a known error code."
default:
    errorString2 = "Unexpected error encountered."
}


// MARK: - Where Clause
/// only setting the value of code is those conditions are being met
var statusCode3 = 404
var errorString3 = "The request failed: "
let error = (code: statusCode3, msg: errorString3)

let firstErrorCode = 404
let secondErrorCode = 418
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("Both error codes are 404")
case (404, _):
    print("Only the first error code is 404 and we don't care about the second code.")
case (_, 404):
    print("Only the second error code is 404 and we don't care about the first code.")
default:
    print("Neither code is 404.")
}


// MARK: - If Case Statements
let age = 32
//if case 18...35 = age {
//    print("Cool demographic")
//}

if case 18...35 = age, age >= 25 {
    print("Cool demographic and can rent a car.")
}

var coffeeAmount = 0
print(Text("^[\(coffeeAmount) goose](inflect: true)"))
coffeeAmount += 1
print(Text("^[\(coffeeAmount) berry](inflect: true)"))
coffeeAmount -= 2
print(Text("^[\(coffeeAmount) cup](inflect: true)"))
coffeeAmount -= 2
print(Text("^[\(coffeeAmount) berry](inflect: true)"))
