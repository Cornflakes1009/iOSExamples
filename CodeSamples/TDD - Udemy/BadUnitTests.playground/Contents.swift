import UIKit
import XCTest

struct BankAccount {
    var user: User?
}

struct User {
    var name: String
}

func test_CreateBankAccountInstance() {
    let bankAccount = BankAccount()
    XCTAssertNotNil(bankAccount)
}

func test_AssignUserToBankAccount() {
    var bankAccount = BankAccount()
    bankAccount.user = User(name: "John")
    XCTAssertNotNil(bankAccount.user)
}
