/*
 Optionals
 */

// nil, sentinel values

var errorCode = 0

// above error code may change, or mean different things to different people.

// optionals

var optionalErrorCode: Int?

optionalErrorCode = 100

optionalErrorCode = nil

// mini-exercises

// 1
var myFavoriteSong: String? = "Ain't no love in the heart of the city"

// 2
var parsedInt = Int("10")
let miniAnswerStatement2 = "it is optional due to the fact that there may not be a number within the string inside the Int parsing function"

// 3
parsedInt = Int("dog")
let miniAnswerStatement3 = "parsedInt is a constant, therefore not allowed to be changed XD. In all seriousness, the new value for 'parsedInt' is 'nil'"

/*
 Unwrapping optionals
 */

var result: Int? = 15
print(result)
//print(result + 1)

// forced unwrapping
var readerName: String? = "Michael Vilabrera"
var readerAge: Int? = 38

var unwrappedReaderName = readerName!
print("Reader is \(unwrappedReaderName)")
print("Reader is \(readerName)")

if readerName != nil {
    print("Reader is \(readerName!)")
} else {
    print("No reader")
}

// optional binding
if let newUnwrappedReaderName = readerName {
    print("Reader is \(newUnwrappedReaderName)")
} else {
    print("No reader")
}

// mini-exercises

// 1
if let favoriteSong = myFavoriteSong {
    print("My favorite song is: \(favoriteSong)")
} else {
    print("No favorite song")
}

// 2
myFavoriteSong = nil
if let favoriteSong = myFavoriteSong {
    print("My favorite song is: \(favoriteSong)")
} else {
    print("No favorite song")
}

/*
 Introducing guard
 */

func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square", "Rectangle":
        return 4
    case "Pentagon":
        return 5
    case "Hexagon":
        return 6
    default:
        return nil
    }
}

// old way
//func printSomeSides(shape: String) {
//    let sides = calculateNumberOfSides(shape: shape)
//    if let sides = sides {
//        print("A \(shape) has \(sides)")
//    } else {
//        print("I don't know how many sides \(shape) has")
//    }
//}

// guard way
func printSomeSides(shape: String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I don't know how many sides \(shape) has")
        return
    }
    print("A \(shape) has \(sides)")
}

// nil coalescing
var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0   // nil coalescing

/*
 Challenges
 */

// 1
let answerStatement1 = """
valid
invalid
valid
valid
"""

// 2
func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
    if value % divisor == 0 {
        print("Yes, it divides \(value / divisor) times")
        return value / divisor
    } else {
        print("Not divisible")
        return nil
    }
}
let testSecondChallengeFunction = divideIfWhole(7, by: 2)

// 3
//func nilCoalescingDivideIfWhole(_ value: Int, by divisor: Int) -> Int? {
//    let sendResult = (value % divisor == 0) ?? value / divisor : 0
//    print("It divides \(result) times")
//    return sendResult
//}
// not clear

// 4
let fourthChallengeNumber: Int??? = 20
print(fourthChallengeNumber)
print(fourthChallengeNumber!)

print(fourthChallengeNumber!!!)
if let oneUnwrap = fourthChallengeNumber {
    if let secondUnwrap = oneUnwrap {
        if let thirdUnwrap = secondUnwrap {
            print(thirdUnwrap)
        }
    }
}
func printNumber(_ number: Int???) {
    if let oneUnwrap = number {
        if let secondUnwrap = oneUnwrap {
            guard let thirdUnwrap = secondUnwrap else {
                return
            }
            print(thirdUnwrap)
        }
    }
}
printNumber(40)
