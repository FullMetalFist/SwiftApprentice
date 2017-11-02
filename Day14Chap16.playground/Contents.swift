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

// implementing protocols

class Bike: Vehicle {
    var peddling = false
    var brakesApplied = false
    func accelerate() {
        peddling = true
        brakesApplied = false
    }
    func stop() {
        peddling = false
        brakesApplied = true
    }
}

// implementing properties

class WheeledBike: WheeledVehicle {
    let numberOfWheels = 2
    var wheelSize = 16.0
    var peddling = false
    var brakesApplied = false
    func accelerate() {
        peddling = true
        brakesApplied = false
    }
    func stop() {
        peddling = false
        brakesApplied = true
    }
}

// associated types in protocols

protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

class HeavyThang: WeightCalculatable {
    // needs integer accuracy
    typealias WeightType = Int
    var weight: Int {
        return 100
    }
}

class LightThang: WeightCalculatable {
    // needs Double accuracy
    typealias WeightType = Double
    var weight: Double {
        return 0.0001
    }
}

// implementing multiple protocols

protocol Wheeled {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}
class TwoProtocolBike: Vehicle, Wheeled {
    var peddling = false
    var braking = false
    var numberOfWheels: Int = 2
    var wheelSize: Double = 20.0
    func accelerate() {
        peddling = true
        braking = false
    }
    func stop() {
        peddling = false
        braking = true
    }
}

// protocol composition

func roundAndRound(transportation: Vehicle & Wheeled) {
    transportation.stop()
    print("Applying breaks to \(transportation.numberOfWheels) wheels")
}

roundAndRound(transportation: TwoProtocolBike())

// extensions and protocol conformance

protocol Reflective {
    var typeName: String { get }
}
extension String: Reflective {
    var typeName: String {
        return "String"
    }
}
let title = "Swift Apprentice"
title.typeName

class YetAnotherBike: Wheeled {
    var peddling = false
    let numberOfWheels = 2
    var wheelSize = 18.0
}
extension YetAnotherBike: Vehicle {
    func accelerate() {
        peddling = true
    }
    func stop() {
        peddling = false
    }
}

// requiring reference semantics

protocol Named {
    var name: String { get set }
}
class ClassName: Named {
    var name: String
    init(name: String) {
        self.name = name
    }
}
struct StructName: Named {
    var name: String
}
var named: Named = ClassName(name: "Class")
var copy = named
named.name = "Always Class"
named.name
copy.name
named = StructName(name: "Struct")
copy = named
named.name = "Maybe Struct?"
named.name
copy.name
protocol ForClassOnlyNamed: class {
    var name: String { get set }
}

// protocols in the standard library, equatable

let a = 5
let b = 5
a == b

let stringA = "String"
let stringB = "String"
stringA == stringB

struct Record {
    var gives: Int
    var takes: Int
}
let recordA = Record(gives: 2, takes: 1)
let recordB = Record(gives: 2, takes: 1)
//recordA == recordB      // not yet equatable
extension Record: Equatable {
    static func ==(lhs: Record, rhs: Record) -> Bool {
        return lhs.gives == rhs.gives && lhs.takes == rhs.takes
    }
}
extension Record: Comparable {
    static func <(lhs: Record, rhs: Record) -> Bool {
        if lhs.gives == rhs.gives {
            return lhs.takes > rhs.takes
        }
        return lhs.gives < rhs.gives
    }
}
recordA == recordB

// free functions

let niceGuy = Record(gives: 10, takes: 1)
let okayGuy = Record(gives: 5, takes: 5)
let meanGuy = Record(gives: 1, takes: 10)
var guys = [niceGuy, meanGuy, okayGuy]
guys.sort() // nice guys finish last!

// other useful protocols, hashable

class Student {
    var email: String
    var firstName: String
    var lastName: String
    init(email: String, firstName: String, lastName: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
}
extension Student: Equatable {
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.email == rhs.email
    }
}
extension Student: Hashable {
    var hashValue: Int {
        return email.hashValue
    }
}

let marshall = Student(email: "marshall@marsh.net", firstName: "Marshall", lastName: "Mathers")
let lockerMap = [marshall: "23A"]

// custom string convertible

extension Student: CustomStringConvertible {
    var description: String {
        return "\(firstName) \(lastName)"
    }
}
print(marshall)

/*
 Challenges
 */

protocol Pet {
    var wasFed: Bool { get set }
}
protocol FlyingPet: Pet {
    var isCaged: Bool { get set }
    var isCageCleaned: Bool { get set }
}
protocol SwimmingPet: Pet {
    var inTank: Bool { get set }
    var isTankCleaned: Bool { get set }
}
protocol WalkablePet: Pet {
    var isWalked: Bool { get set }
}

struct Bird: FlyingPet {
    var wasFed: Bool
    var isCaged: Bool
    var isCageCleaned: Bool
}

struct Fish: SwimmingPet {
    var wasFed: Bool
    var inTank: Bool
    var isTankCleaned: Bool
}

struct Cat: WalkablePet {
    var wasFed: Bool
    var isWalked: Bool
}

struct Dog: WalkablePet {
    var wasFed: Bool
    var isWalked: Bool
}

var parrot = Bird(wasFed: false, isCaged: true, isCageCleaned: false)
var goldfish = Fish(wasFed: false, inTank: true, isTankCleaned: false)
var houseCat = Cat(wasFed: false, isWalked: false)
var houseDog = Dog(wasFed: false, isWalked: false)

let petArray: [Pet] = [parrot, goldfish, houseCat, houseDog]

