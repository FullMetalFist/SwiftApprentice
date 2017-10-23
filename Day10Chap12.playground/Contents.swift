/*
 Methods
 */

// method refresher

var numbers = [1, 2, 3]
numbers.removeLast()
numbers

// comparing methods to computed properties, turning a function into a method

let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
//struct SimpleDate {
//    var month: String
//}
//func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
//    return months.index(of: "December")! - months.index(of: date.month)!
//}

//struct SimpleDate {
//    var month: String
//    func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
//        return months.index(of: "December")! - months.index(of: date.month)!
//    }
//}
//let thisMonth = SimpleDate(month: "October")
//thisMonth.monthsUntilWinterBreak(from: thisMonth)
//thisMonth.monthsUntilWinterBreak()  // not like this!

// introducing self

struct SimpleDate {
    var month: String
    func monthsUntilWinterBreak() -> Int {
        return months.index(of: "December")! - months.index(of: self.month)!    // it is possible to remove 'self' here
    }
}
let thisMonth = SimpleDate(month: "October")
thisMonth.monthsUntilWinterBreak()  // its okay now

// mini-exercise

struct MiniExerciseSimpleDate {
    var month: String
    var monthsUntilWinterBreak: Int {
        get {
            return months.index(of: "December")! - months.index(of: month)!
        }
    }
}
let thatMonth = MiniExerciseSimpleDate(month: "July")
thatMonth.monthsUntilWinterBreak

// introducing initializers

struct SimpleDateWithInit {
    var month: String
    init() {
        month = "January"
    }
    func monthsUntilWinterBreak() -> Int {
        return months.index(of: "December")! - months.index(of: month)!
    }
}
let dateWithInit = SimpleDateWithInit()
dateWithInit.month      // January
dateWithInit.monthsUntilWinterBreak()

// initializers in Structures

struct SimpleDateWithInitInsideStruct {
    var month: String
    var day: Int
    init() {
        month = "January"
        day = 1
    }
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }
    func monthsUntilWinterBreak() -> Int {
        return months.index(of: "December")! - months.index(of: month)!
    }
}
let valentinesDay = SimpleDateWithInitInsideStruct(month: "February", day: 14)

// introducing mutating methods, type methods

struct Math {
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1, *)
    }
}
Math.factorial(of: 7)

// mini-exercise

struct MathMiniExercise {
    static func nthTriangleNumber(of number: Int) -> Int {
        return (1...number).reduce(1, +)
    }
}
MathMiniExercise.nthTriangleNumber(of: 7)

// adding to an existing structure with extensions

extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        var testFactor = 2
        var primes: [Int] = []
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            } else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}
Math.primeFactors(of: 45)

// keeping the compiler generated initializer using extensions

struct LastSimpleDate {
    var month: String
    var day: Int
    func monthsUntilWinterBreak() -> Int {
        return months.index(of: "December")! - months.index(of: month)!
    }
    mutating func advance() {
        day += 1
    }
}
extension LastSimpleDate {
    init() {
        month = "January"
        day = 1
    }
}

/*
 Challenges
 */

// 1
struct Circle {
    var radius = 0.0
    var area: Double {
        return .pi * radius * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
    mutating func grow(byFactor: Int) {
        radius *= Double(byFactor).squareRoot()
    }
}
var challengeCircle = Circle(radius: 5)
challengeCircle.area
challengeCircle.grow(byFactor: 4)
challengeCircle.area

// 2
struct ChallengeSimpleDate {
    var month: String
    var day: Int
    mutating func advance() {
        if (day != 28 && day != 30 && day != 31) {
            day += 1
        } else if day == 28 {
            if month == "February" {
                day = 1
                month = "March"
            } else {
                day += 1
            }
        } else if day == 30 {
            day = 1
            switch month {
            case "April":
                month = "May"
            case "June":
                month = "July"
            case "September":
                month = "October"
            default:
                month = "December"
            }
        } else if day == 31 {
            day = 1
            switch month {
            case "January":
                month = "February"
            case "March":
                month = "April"
            case "May":
                month = "June"
            case "July":
                month = "August"
            case "August":
                month = "September"
            case "October":
                month = "November"
            default:
                month = "January"
            }
        }
    }
}
var challengeSimpleDate = ChallengeSimpleDate(month: "February", day: 28)
challengeSimpleDate.advance()
challengeSimpleDate.day
challengeSimpleDate.month

// 3
struct ChallengeMath {
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1, *)
    }
    static func isEven(number: Int) -> Bool {
        return number % 2 == 0
    }
    static func isOdd(number: Int) -> Bool {
        return number % 2 == 1
    }
}

// 3
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}
// 4    // probably incorrect
extension Int {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        var testFactor = 2
        var primes: [Int] = []
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            } else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}
