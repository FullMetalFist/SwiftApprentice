/*
 Protocols
 */

import Foundation

// introducing protocols

protocol Vehicle {
    func accelerate()
    func stop()
}

// protocol syntax

class Unicycle: Vehicle {
    var peddling = false
    func accelerate() {
        peddling = true
    }
    func stop() {
        peddling = false
    }
}

// methods in protocols

enum Direction {
    case left
    case right
}

protocol DirectionalVehicle {
    func accelerate()
    func stop()
    func turn()
    func turn(_ direction: Direction)
    func description() -> String
}

// properties in protocols

protocol VehicleProperties {
    var weight: Int { get }
    var name: String { get set }
}

// initializers in protocols

protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    var value: Double
    required init(initialAmount: Double) {
        value = initialAmount
    }
    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else {
            return nil
        }
        value = transferAccount.value
    }
}
var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!

// protocol inheritance

protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

// mini-exercises

protocol Area {
    var area: Double { get }
}
struct Square: Area {
    var area: Double {
        return side * side
    }
    var side: Double = 5
}
struct Triangle: Area {
    var area: Double {
        return base * height * 0.5
    }
    var base: Double = 2
    var height: Double = 4
}
struct Circle: Area {
    var area: Double {
        return radius * radius * .pi
    }
    var radius: Double = 5
}
