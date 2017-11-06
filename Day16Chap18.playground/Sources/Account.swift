import Foundation

public protocol Account {
    associatedtype Currency
    var balance: Currency { get }
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}

public typealias Dollars = Double

// A basic US Dollar based account

open class BasicAccount: Account {
    private(set) public var balance: Dollars = 0.0
    public func deposit(amount: Dollars) {
        balance += amount
    }
    public func withdraw(amount: Dollars) {
        if amount <= balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
    public init() { }
}

