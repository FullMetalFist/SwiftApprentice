/*
 Access Control & Code Organization
 */

import Foundation

// problems introduced by lack of access control

//protocol Account {
//    associatedtype Currency
//    var balance: Currency { get }
//    func deposit(amount: Currency)
//    func withdraw(amount: Currency)
//}
//
//typealias Dollars = Double
//
//// A basic US Dollar based account
//
//class BasicAccount: Account {
//    private(set) var balance: Dollars = 0.0
//    func deposit(amount: Dollars) {
//        balance += amount
//    }
//    func withdraw(amount: Dollars) {
//        if amount <= balance {
//            balance -= amount
//        } else {
//            balance = 0
//        }
//    }
//}
//
let account = BasicAccount()
account.deposit(amount: 10.00)
account.withdraw(amount: 5.00)

// account.balance = 1000000000000.00      // tsk tsk

// introducing access control

/*
 private - accessible only to the defining type, all nested types, and extensions on that type in the same source file
 fileprivate - accessible from anywhere within the source file in which it's defined
 interal - accessible from anywhere within the module in which it's defined. Default
 public - accessible from anywhere within the module in which it's defined, as well as other software modules that imports this module
 open - same as public, allowing itsself to be overridden by code in another module
 */

// private

//class CheckingAccount: BasicAccount {
//    private let accountNumber = UUID().uuidString
//    class Check {
//        let account: String
//        var amount: Dollars
//        private(set) var cashed = false
//        func cash() {
//            cashed = true
//        }
//        init(amount: Dollars, from account: CheckingAccount) {
//            self.amount = amount
//            self.account = account.accountNumber
//        }
//    }
//    func writeCheck(amount: Dollars) -> Check? {
//        guard balance > amount else {
//            return nil
//        }
//        let check = Check(amount: amount, from: self)
//        withdraw(amount: check.amount)
//        return check
//    }
//    func deposit(_ check: Check) {
//        guard !check.cashed else { return }
//        deposit(amount: check.amount)
//        check.cash()
//    }
//}

let joeChecking = CheckingAccount()
joeChecking.deposit(amount: 500.00)
let check = joeChecking.writeCheck(amount: 250.00)!

let janChecking = CheckingAccount()
janChecking.deposit(check)
janChecking.balance

janChecking.deposit(check)      // nope
janChecking.balance

// playground sources, fileprivate, internal, public, and open

class SavingsAccount: BasicAccount {
    var interestRate: Double
    init(interestRate: Double) {
        self.interestRate = interestRate
    }
    func processInterest() {
        let interest = balance * interestRate
        deposit(amount: interest)
    }
}

// mini-exercises

let dude = Person(firstName: "Mister", lastName: "Dude")
dude.fullName

class Doctor: ClassyPerson {
    override var fullName: String {
        get {
            return "Dr. \(super.fullName)"
        }
    }
}

let doctor = Doctor(firstName: "Duran", lastName: "Duran")
doctor.fullName

// extensions by behavior, extensions by protocol conformance




