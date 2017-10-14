/*
 Advanced Control Flow
 */

// countable ranges
let closedRange = 0...10    // up to & including '10'

let halfOpenRange = 0..<6   // up to but not including '6'

// for loops
let forLoopCount = 10
var forLoopSum = 0
for i in 1...forLoopCount {
    forLoopSum += i
}
print(forLoopSum)


forLoopSum = 1
var forLoopLastSum = 0
for _ in 0..<forLoopCount {
    let temp = forLoopSum
    forLoopSum = forLoopSum + forLoopLastSum
    forLoopLastSum = temp
}
print(forLoopSum)

forLoopSum = 0
for i in 1...forLoopCount where i % 2 == 1 {
    forLoopSum += i
}
print(forLoopSum)

// continue and labeled statements
forLoopSum = 0
for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    
    for column in 0..<8 {
        forLoopSum += row * column
    }
}
print(forLoopSum)

forLoopSum = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        forLoopSum += row * column
    }
}
print(forLoopSum)

// mini-exercises

// 1
let exerciseRange = 1...10
for i in exerciseRange {
    print(i * i)
}

import Foundation

// 2 Foundation needed for 'sqrt'
for i in exerciseRange {
    print(sqrt(Double(i)))
}

// 3
forLoopSum = 0
for row in 0..<8 where row % 2 == 1 {
    for column in 0..<8 {
        forLoopSum += row * column
    }
}
print(forLoopSum)

// switch statements

let switchNumber = 10
switch switchNumber {
case 0:
    print("Zero")
default:
    print("Not zero")
}

switch switchNumber {
case 10:
    print("Ten")
default:
    break
}

let switchString = "Dog"
switch switchString {
case "Cat", "Dog":
    print("House pet")
default:
    print("Not a house pet")
}

// advanced switch statements

let hourOfDay = 8
let firstTimeOfDay: String

switch hourOfDay {
case 0, 1, 2, 3, 4, 5:
    firstTimeOfDay = "Early morning"
case 6, 7, 8, 9, 10, 11:
    firstTimeOfDay = "Morning"
case 12:
    firstTimeOfDay = "Noon"
case 13, 14, 15, 16:
    firstTimeOfDay = "Afternoon"
case 17, 18, 19:
    firstTimeOfDay = "Evening"
case 20, 21, 22, 23:
    firstTimeOfDay = "Late evening"
default:
    firstTimeOfDay = "invalid hour"
}
print(firstTimeOfDay)

let secondTimeOfDay: String
switch hourOfDay {
case 0...5:
    secondTimeOfDay = "Early morning"
case 6...11:
    secondTimeOfDay = "Morning"
case 12:
    secondTimeOfDay = "Noon"
case 13...16:
    secondTimeOfDay = "Afternoon"
case 17...19:
    secondTimeOfDay = "Evening"
case 20...23:
    secondTimeOfDay = "Late evening"
default:
    secondTimeOfDay = "invalid hour"
}
print(secondTimeOfDay)

switch switchNumber {
case let x where x % 2 == 0:
    print("Even")
default:
    print("Odd")
}

switch switchNumber {
case _ where switchNumber % 2 == 0:
    print("Even")
default:
    print("Odd")
}

// partial matching

let switchCoordinates = (x: 3, y: 4, z: 5)
switch switchCoordinates {
case (0, 0, 0):
    print("origin")
case (_, 0, 0):
    print("on the X axis")
case (0, _, 0):
    print("on the Y axis")
case (0, 0, _):
    print("on the Z axis")
default:
    print("somwhere in space")
}

switch switchCoordinates {
case (0, 0, 0):
    print("Origin")
case (let x, 0, 0):
    print("On the x axis at x = \(x)")
case (0, let y, 0):
    print("On the y axis at y = \(y)")
case (0, 0, let z):
    print("On the z axis at z = \(z)")
case let (x, y, z):
    print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

switch switchCoordinates {
case let (x, y, _) where y == x:
    print("Along the y = x line.")
case let (x, y, _) where y == x * x:
    print("Along the y = x^2 line")
default:
    break
}

// mini-exercises

// 1
let switchAge = 38
switch switchAge {
case 0...2:
    print("Infant")
case 3...12:
    print("Child")
case 13...19:
    print("Teenager")
case 20...39:
    print("Adult")
case 40...60:
    print("Middle aged")
default:
    print("Elderly")
}

// 2
let switchTuple = ("Michael", switchAge)
switch switchTuple.1 {
case 0...2:
    print("\(switchTuple.0) is an Infant")
case 3...12:
    print("\(switchTuple.0) is a Child")
case 13...19:
    print("\(switchTuple.0) is a Teenager")
case 20...39:
    print("\(switchTuple.0) is an Adult")
case 40...60:
    print("\(switchTuple.0) is Middle aged")
default:
    print("\(switchTuple.0) is Elderly")
}

/*
 Challenges
 */

// 1
let answerStatement1 = "sum will equal 15, with 6 iterations"

// 2
let answerStatement2 = "there will be 10 instances (final one will be added when .count == 9)"

// 3
let answerStatement3 = """
On the x/y plane
x = y = z
On the x/z plane
Nothing special
On the y/z plane
"""

// 4
let answerStatement4 = "a closed range has limits, an upper and lower bound. The upper bound must always be greater than or equal to the lower bound"

// 5
var i = 10
while i > 0 {
    print("T-\(i)")
    i -= 1
}

// 6
for dec in 0..<10 {
    print(Double(dec) * 0.1)
}
