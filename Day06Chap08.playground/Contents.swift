/*
 Collection iteration with closures
 */

// closure basics
var multiplyClosure: (Int, Int) -> Int

multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}
let result = multiplyClosure(5, 7)

// shorthand syntax

multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}
multiplyClosure = { (a, b) in
    a * b
}
multiplyClosure = { $0 * $1 } // stanford lecture

func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = { (a: Int, b: Int) in
    a + b
}
operateOnNumbers(5, 7, operation: addClosure)
func addFunction(_ a: Int, _ b: Int) -> Int {
    return a + b
}
// caused error, not sure why
//operateOnNumbers(13, 17, operation: addFunction(_:_:))

operateOnNumbers(9, 3, operation: { (a: Int, b: Int) -> Int in
    return a + b
})

operateOnNumbers(6, 2, operation: { $0 + $1 })

// why not keep this as the final example
operateOnNumbers(5, 2, operation: + )

// instead of this
// also caused error
//operateOnNumbers(3, 7) {
//    $0 + $1
//}

// closures with no return value
let voidClosure: () -> Void = {
    print("I love Swift")
}

var counter = 0
let incrementCounter = {
    counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
print(counter)

func countingClosure() -> () -> Int {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

counter1()  // 1
counter2()  // 1
counter1()  // 2
counter2()  // 2
counter1()  // 3
counter1()  // 4
counter1()  // 5
counter2()  // 3

// custom sorting with closures

let letters = ["CCC", "DDDD", "BB", "EEEEE", "A"]
letters.sorted()

letters.sorted {
    $0.count > $1.count
}

// iterating over collections with closures

let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}

var prices = [1.5, 10, 3.99, 2.70, 6.13]
let largePrices = prices.filter {
    return $0 > 5
}

let salePrices = prices.map {
    return $0 * 0.9
}

let userInput = ["1", "0", "heylo", "99", "4.6"]
let numbers1 = userInput.map {
    Int($0)
}
let numbers2 = userInput.flatMap {
    Int($0)
}

let sum = prices.reduce(0) {
    return $0 + $1
}

let stock = [1.5: 5, 10: 2, 3.99: 20, 2.70: 13, 6.13: 12]
let stockSum = stock.reduce(0) {
    return $0 + $1.key * Double($1.value)
}

let zooAnimals = ["🦁": 4, "🐯": 2, "🐻": 3]
let allAnimals = zooAnimals.reduce(into: []) {
    (result, this: (key: String, value: Int)) in
    for _ in 0 ..< this.value {
        result.append(this.key)
    }
}

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)

let captureFirstTwo = prices.prefix(2)
let captureLastTwo = prices.suffix(2)

// mini-exercises

// 1
let names = ["Cris", "Gautham", "Jen", "Hiren"]
let concatenation = names.reduce("") {
    return $0 + $1
}

// 2
let moreThanFourCharacters = names.filter {
    return $0.count > 4
}
let moreThanFourCharactersConcatenation = moreThanFourCharacters.reduce("") {
    return $0 + $1
}

// 3
let namesAndAges = ["Dude": 20, "Mister": 35, "Kid": 15, "Gramps": 60]
let under18 = namesAndAges.filter {
    return $0.value < 18
}

// 4
let over18 = namesAndAges.filter {
    return $0.value > 18
}
let over18Names = over18.map {
    return $0.key
}

/*
 Challenges
 */

// 1
func repeatTask(times: Int, task: () -> Void) {
    for _ in 0..<times {
        task()
    }
}
let taskClosure: () -> Void = {
    print("Swift Apprentice is a good book")
}
repeatTask(times: 10, task: taskClosure)

// 2
func mathSum(length: Int, series: (Int) -> Int) -> Int {
    var sum = 0
    /*
     thought the loop should be set to 0..<length
     */
    for i in 0...length {
        sum += series(i)
    }
    return sum
}

// from chap 5
func fibonacci(_ number: Int) -> Int {
    if number <= 0 {
        return 0
    }
    if number == 1 || number == 2 {
        return 1
    }
    var first = number - 1
    var second = number - 2
    let sum = first + second
    first = second
    second = sum
    return fibonacci(number - 1) + fibonacci(number - 2)
}

let squareClosure: (Int) -> Int = {
    return $0 * $0
}

let squareChallenge = mathSum(length: 10, series: squareClosure)
let fibonacciChallenge = mathSum(length: 10, series: fibonacci(_:))

// 3
let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]
//
//let averageRatings = appRatings.forEach {
//    for (key, value) in {
//        
//    }
//}

