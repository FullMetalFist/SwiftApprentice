/*
 Basic Control Flow
 */

// comparison operators

let yes: Bool = true
let no = false

// boolean operators

// equality operator
let doesFourEqualFive = (4 == 5)

let doesNineNotEqualEight = (9 != 8)

let alsoTrue = !(7 == 6)

let isThreeLessThanTwo = (3 < 2)
let isThreeGreaterThanTwo = (3 > 2)

// boolean logic

let and = true && true
let or = false || true

let andBothTrue = 3 < 4 && 6 < 7
let andOneFalse = 5 > 4 && 8 > 9

let orOneTrue = 3 > 4 || 6 < 7
let orBothFalse = 5 == 6 || 8 > 9

let andOr = (9 < 10 && 3 < 5) || 1 > 4

// string equality

let guess = "triangle"
let squareEqualsTriangle = guess == "square"

let order = "Roger" < "Sam"

// mini-exercises

// 1
let myAge = 38
let isTeenager = (myAge > 13) && (myAge < 19)

// 2
let theirAge = 30
let bothTeenagers = ((myAge > 13) && (myAge < 19)) && ((theirAge > 13) && (theirAge < 19))

// 3
let reader = "Michael Vilabrera"
let author = "Matt Galloway"
let authorIsReader = reader == author

// 4
let readerBeforeAuthor = ""

/*
 if statement
 */

if 3 < 5 {
    print("Three is indeed less than five")
}

let toy = "Drone"

if toy == "Lego" || toy == "Ball" {
    print("The toy is inexpensive and for young children")
} else {
    print("The toy is expensive and not for young children")
}

let hourOfDay = 9
let timeOfDay: String

if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay == 12 {
    timeOfDay = "Noon"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late night"
} else {
    timeOfDay = "Invalid hour"
}

print(timeOfDay)

// short circuiting

let name = "Mister G" // to silence compiler
if 1 > 2 && name == "The Dude" {
    // forever false because of content before &&
}

if 1 < 2 || name == "The Dude" {
    // forever true because of content before ||
}

// encapsulating variables

var hoursWorked = 45

var salary = 0
if hoursWorked > 40 {
    let overtime = hoursWorked - 40
    salary += overtime * 50
    hoursWorked -= overtime
}
salary += hoursWorked * 25
print(salary)

// ternary conditional operator
let a = 3
let b = 7
let min = a < b ? a : b
let max = a > b ? a : b

// mini-exercises

// 1
let myNewAge = 38
if myNewAge > 13 && myNewAge < 19 {
    print("Teenager")
} else {
    print("Not a teenager")
}

// 2
let answer = myNewAge > 13 && myNewAge < 19 ? "Teenager" : "Not a teenager"
print(answer)

/*
 Loops
 */

// while loops
// potential to be infinite if conditions are not correct

var sum = 1
while sum < 1000 {
    sum = sum + (sum + sum)
}

// used to be do-while. always runs at least once
sum = 1
repeat {
    sum = sum + (sum + sum)
} while sum < 1000

// break out
sum = 1
while true {
    sum = sum + (sum + sum)
    if sum >= 1000 {
        break
    }
}

// mini-exercises

var counter = 0
while counter < 10 {
    print("counter = \(counter)")
    counter += 1
}

// Foundation necessary for next task
import Foundation

counter = 0
var roll = 0
repeat {
    roll = Int(arc4random_uniform(6))
    print("After \(counter) rolls, roll is \(roll + 1)")
} while roll != 0

/*
 Challenges
 */

// 1
let answerStatement1 = "scoping is the problem, 'lastName' is only initialized within the 'if' statements"

// 2
let answerStatement2 = """
first: true
second: false
third: true
fourth: true
"""

// 3
var position = 0
var chessboard = (row: 0, column: 0)

// given the assumption that we are moving along rows, next position increments the column until the column gets to '7'- then it is reset to '0' and the row increments by '1'
chessboard.row = 4
chessboard.column = 5
position = (chessboard.row + (chessboard.column * 7)) - 1

// 4
let coefA = 3
let coefB = 5
let coefC = 7
let x = 2
let y = coefA * (x)^2 + coefB * x + coefC

// 5
let months = ("january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december")
let year = 2018
var days = 0
var countMonths = 0
repeat {
    countMonths += 1
    if countMonths == 1 || countMonths == 3 || countMonths == 5 || countMonths == 7 || countMonths == 8 || countMonths == 10 || countMonths == 12 {
        days += 31
    } else if countMonths == 4 || countMonths == 6 || countMonths == 9 || countMonths == 11 {
        days += 30
    } else if countMonths == 2 {
        if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
            days += 29
        } else {
            days += 28
        }
    }
    
} while countMonths < 12
print(days)

// 6
let possiblePowerOfTwo = 36.0
let powerResult = log2(possiblePowerOfTwo)
let isPowerOfTwo = powerResult == ceil(powerResult)

// 7
var power = 1
var exponent = 0
repeat {
    exponent = 2 << power
    print("The \(power) power of 2 is: \(exponent)")
    power += 1
} while power <= 10
print(exponent)

// 8
let fibonacciNum = 4
var count = 0
var fibResult = 0
var first = 1
var second = 1

repeat {
    
    fibResult = first + second
    first = second
    second = fibResult
    count += 1
} while count < fibonacciNum
print(fibResult)

// 9
var number = 5
var factorial: Int = 1
repeat {
    factorial *= number
    number -= 1
} while number > 1
print(factorial)

// 10
let numberRoll = 7
// Int(arc4random_uniform(6))
