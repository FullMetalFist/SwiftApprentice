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
icon.fileName

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


