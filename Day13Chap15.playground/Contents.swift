/*
 Enumerations
 */

// declaring an enumeration

enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
    var semester: String {
        switch self {
        case .august, .september, .october, .november, .december:
            return "Autumn"
        case .january, .february, .march, .april, .may:
            return "Spring"
        case .june, .july:
            return "Summer"
        }
    }
    func monthsUntilWinterBreak() -> Int {
        return Month.december.rawValue - self.rawValue
    }
}
func semester(for month: Month) -> String {
    switch month {
    case .august, .september, .october, .november, .december:
        return "Autumn"
    case .january, .february, .march, .april, .may:
        return "Spring"
    case .june, .july:
        return "Summer"
    }
}
var month = Month.april
semester(for: month)
month = .september
semester(for: month)
month = .june
semester(for: month)

// mini-exercise
var semester = month.semester

// code completion prevents typos, raw values, accessing the raw value

func monthsUntilWinterBreak(from month: Month) -> Int {
    return Month.december.rawValue - month.rawValue
}
monthsUntilWinterBreak(from: .may)  // 7

// initializing with the raw value

let sixthMonth = Month(rawValue: 6)!    // <- because an optional is returned
monthsUntilWinterBreak(from: sixthMonth)

// mini-exercise
let monthsLeft = sixthMonth.monthsUntilWinterBreak()

// string raw values

enum Icon: String {
    case music
    case sports
    case weather
    var fileName: String {
        return "\(rawValue).png"
    }
}
let iconWeather = Icon.weather
iconWeather.fileName

// unordered raw values

enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
    case halfDollar = 50
    case silverDollar = 100
}
let coinKennedy = Coin.halfDollar
coinKennedy.rawValue

// mini-exercise
var coinPurse: [Coin] = []
coinPurse.append(.dime)
coinPurse.append(.halfDollar)
coinPurse.append(.penny)

// associated values

var balance = 100
func withdraw(amount: Int) {
    balance -= amount
}
enum WithdrawResult {
    case success(newBalance: Int)
    case error(message: String)
}
func withdraw(amount: Int) -> WithdrawResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return .error(message: "Not enough funds")
    }
}

// ambiguous use case of 'withdraw'
//let result = withdraw(amount: 99)
//switch result {
//case .success(let newBalance):
//    print("Your new balance is: \(newBalance)")
//case .error(let message):
//    print(message)
//}

enum HTTPMethod {
    case get
    case post(body: String)
}
let request = HTTPMethod.post(body: "Hello there")
guard case .post(let body) = request else {
    fatalError("No message was found")
}
print(body)

// enumeration as state machine

enum TrafficLight {
    case red, yellow, green
}
let trafficLight = TrafficLight.red

// mini-exercise

enum Light {
    case on
    case off
}

// case-less enumerations

enum Math: Double {
    case e = 2.7183
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1, *)
    }
    
}
let factorial = Math.factorial(of: 6)

// mini-exercise
import Foundation

let nestEgg = 25000 * pow(Math.e.rawValue, 0.07 * 20)

// optionals

var age: Int?
age = 17
age = nil

switch age {
case .none:
    print("No value")
case .some(let value):
    print("Got a value \(value)")
}

let optionalNil: Int? = .none
optionalNil == nil
optionalNil == .none

/*
 Challenge
 */

