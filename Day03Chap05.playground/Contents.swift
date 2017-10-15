/*
 Functions
 */

// Function basics

func printSomeWords() {     // no parameters, as shown by the empty parentheses. void function, as shown by nothing after the ()
    print("Some Words")     // function body
}

// function parameters

func printMultipleOfSeven(value: Int) {
    print("\(value) * 7 = \(value * 7)")
}
printMultipleOfSeven(value: 90)

func printMultipleOf(multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(multiplier: 9, and: 3)

// return values

func add(_ first: Int, and second: Int) -> Int {
    return first + second
}
let firstSum = add(3, and: 5)

func addAndSubtract(_ first: Int, and second: Int) -> (sum: Int, difference: Int) {
    return (first + second, first - second)
}
let secondResult = addAndSubtract(15, and: 10)
let secondSum = secondResult.sum
let secondDifference = secondResult.difference

// advanced parameter handling
func decrementAndPrint(_ value: inout Int) {
    value -= 1
    print(value)
}
var thirdResult = 6
decrementAndPrint(&thirdResult) // ampersand is baked in

// overloading
func getValue() -> Int {
    return 22
}
func getValue() -> String {
    return "Twenty-two"
}
let fourthValueInt: Int = getValue()
let fourthValueString: String = getValue()

// mini-exercises

// 1
func printFullName(firstName: String, and lastName: String) {
    print(firstName + " " + lastName)
}
printFullName(firstName: "Michael", and: "Vilabrera")

// 2
func printFullName(_ first: String, _ last: String) {
    print(first + " " + last)
}
printFullName("Michael", "Vilabrera")

// 3
func calculateFullName(firstName: String, and lastName: String) -> String {
    return firstName + " " + lastName
}
let fullName = calculateFullName(firstName: "Michael", and: "Vilabrera")

// 4
func calculateFullName(firstName: String, lastName: String) -> (name: String, length: Int) {
    let fullName = firstName + " " + lastName
    return (fullName, fullName.count)
}
let nameWithLength = calculateFullName(firstName: "Michael", lastName: "Vilabrera")
let exerciseName = nameWithLength.name
let exerciseLength = nameWithLength.length

/*
 Functions as variables
 */

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}
var fucntionSample = subtract
fucntionSample(5, 3)

func division(_ a: Int, _ b: Int) -> Int {
    return a / b
}
fucntionSample = division
fucntionSample(3, 1)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(division, 4, 2)

// the land of no return (not void)
func noReturn() -> Never {
    // some code which must be never-returning
    while true {
        // infinite loop
    }
}

/*
 Challenges
 */

// 1
let answerChallenge1 = "the difference is the first loop behaves as ..< and the second loop behaves as ... ranges."
func sampleStride(start: Double, finish: Double, by: Double) {
    for i in stride(from: start, through: finish, by: by) {
        print(i)
    }
}
sampleStride(start: 10.0, finish: 9.0, by: 0.1)

// 2
func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool {
    return (number % divisor) == 0
}

func isPrime(_ number: Int) -> Bool {
    if number < 0 {
        return false
    }
    var findDivisor = 2
    while findDivisor < number {
        
        findDivisor += 1
        if findDivisor == number {
            return true
        }
        
        if number % findDivisor == 0 {
            return false
        }
    }
    return false
}

isPrime(7)

// 3
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

fibonacci(3)
