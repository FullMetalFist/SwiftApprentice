/*
 Print statement
 */

print("this is a print statement")

/*
 Arithmetic
 */

2 + 5

9 - 2

3.5 * 2

14 / 2

// keep spacing for readability

/*
 Decimal numbers
 */

5.0 / 3.0

/*
 Modulo operation (remainder), for use with 'Int' only
 */

5 % 3

// modulo with decimals
(5.0).truncatingRemainder(dividingBy: 3.0)

/*
 Shift operations
 */

5 >> 2

5 << 2

/*
 Order of Operations, PEMDAS
 */

((500 / (10 * 2)) - 20) << (35 % 6)

/*
 Math functions, we need Foundation
 */
import Foundation

sin(90 * Double.pi / 180)

cos(45 * Double.pi / 180)

(5.0).squareRoot()

min(3, 30)

max(3, 30)

// combine the functions
min(sin(90 * Double.pi / 180), cos(90 * Double.pi / 180))

/*
 Naming data
 */

// constants
let comedyNumber: Int = 3
let goldenNumber: Double = (1.0 + sqrt(5.0)) / 2.0

// variables
var changableNumber: Int = 0
changableNumber += 1
changableNumber = 1_000

// use meaningful names
var anotherChangableNumber = changableNumber

// increment and decrement
changableNumber -= 1
changableNumber += 1

// mini-exercises

// 1
let myAge: Int = 38
// 2
var averageAge: Double = (Double(myAge) + 30) / 2
// 3
let testNumber = 6
let evenOdd = testNumber % 2        // evenOdd updates when testNumber is changed
// 4
var answer = 0
answer += 1
answer += 10
answer *= 10
answer = answer >> 3                // our answer is 13

// challenges
// 1
let exercises = 9
var exercisesSolved = 0
exercisesSolved += 1

// 2
var age: Int = 16
print(age)
age = 30
print(age)
exercisesSolved += 1

// 3
let a: Int = 46
let b: Int = 10
    // a
    let answer1: Int = (a * 100) + b
    // b
    let answer2: Int = (a * 100) + (b * 100)
    // c
    let answer3: Int = (a * 100) + (b / 10)
exercisesSolved += 1

// 4
((5 * 3) - 4) / (2 * 2)
exercisesSolved += 1


// 5
let newA: Double = 3.0
let newB: Double = 5.0
let average: Double = (3.0 + 5.0) / 2
exercisesSolved += 1

// 6
let farenheit: Double = 212.0
let celcius: Double = (farenheit - 32) * 5 / 9
exercisesSolved += 1

// 7
let position = 42
let row = 6
let column = 6
let verify: Bool = column * (row + 1) == position
exercisesSolved += 1

// 8
let degrees: Double = 180
let radians: Double = Double.pi * 180 / 180
exercisesSolved += 1

// 9
let x1: Double = 1.0
let y1: Double = 1.0
let x2: Double = 3.0
let y2: Double = 2.0

// dist = sqrt((x1 - x2)^2 + (y1 - y2)^2)
let distance = sqrt((pow((x2 - x1), 2)) + pow((y2 - y1), 2))
exercisesSolved += 1
