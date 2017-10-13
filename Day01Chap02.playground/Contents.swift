/*
 Type conversion
 */

var integer: Int = 101
var decimal: Double = 10.5

integer = Int(decimal)

// operators with mixed types
let hourlyRate: Double = 15.0
let hoursWorked: Int = 35
let totalSalary: Double = hourlyRate * Double(hoursWorked)

// type inference
let typeInferredDouble = 1.0

let forcedDouble = Double(4)
let fourAsDouble = 4 as Double

// mini exercies
// 1
let age1 = 42
let age2 = 21

// 2
let avg1 = (age1 + age2) / 2    // missing 0.5

// 3
let avg2 = Double(age1 + age2) / 2.0

/*
 Strings
 */

// characters and strings
let characterA: Character = "a"
let characterSeeNoEvil: Character = "🙈"

let stringPerson: String = "Person"
let anotherStringPerson = "Person"

// concatenation
var message = "Hello" + " welcome "
let name = "Dude"
message += name
let exclamationMark: Character = "!"
message += String(exclamationMark)
message = "Hello welcome \(name)!"

let twoThirds = 2.0 / 3.0
let twoThirdsLongString = "Two thirds is \(twoThirds) in decimal format"

// multi-line strings
let haiku = """
An old silent pond...
A frog jumps into the pond,
splash! Silence again.

Autumn moonlight—
a worm digs silently
into the chestnut.

In the twilight rain
these brilliant-hued hibiscus -
A lovely sunset.
"""
// mini-exercises

// 1
let firstName = "Michael"
let lastName = "Vilabrera"

// 2
let fullName = firstName + " " + lastName

// 3
let myDetails = "Nice to meet you, my name is \(fullName)"

/*
 Tuples
 */
let coordinates: (Int, Int) = (1, 5)
let moreCoordinates = (5, 1)
let coordDouble = (3.0, 4.0)
let coordMixed = (2.5, 1)

let x1 = coordinates.0
let y1 = coordinates.1

let coordNamed = (x: 1, y: 0)
let x2 = coordNamed.x
let y2 = coordNamed.y

let coord3D = (x: 20, y: 10, z: 30)
let (x3, y3, z3) = coord3D
let (x4, y4, _) = coord3D

// mini-exerises

// 1, 2
let dateTemp = (month: 3, day: 17, year: 2002, temp: 55.0)

// 3
let (_, day, _, temp) = dateTemp

// 4
var variableDateTemp = (month: 3, day: 17, year: 2002, temp: 55.0)
var (_, newDay, _, newTemp) = variableDateTemp
variableDateTemp.temp = 35.5

/*
 Preview protocols
 */

/*
 Challenges
 */

// 1
let challengeCoordinates = (x: 2, y: 3)

// 2
let namedCoordinate = (row: 4, column: 5)

// 3
let answerStatement3 = "First is incorrect, as a character can only be a single character, not three. The following three are valid."

// 4
let answerStatement4 = "referencing the tuple with 'Day' is incorrect, the reference is case-sensitive"

// 5
let answerStatement5 = "it is impossible to append anything to a constant"

// 6
let answerStatement6 = "value = 1.5. This is because the first index is always 'zero'"

// 7
let answerStatement7 = "month = 8"

// 8
let number = 10
let multiplier = 5
let summary = "\(number) multiplied by \(multiplier) equals \(number * multiplier)"
let answerStatement8 = "the value of 'summary' is \(summary)"

// 9
let a = 4
let b: Int32 = 100
let c: UInt8 = 12
let together = a + Int(b) + Int(c)

// 10
let answerStatement10 = "the numeric difference between \(Float.pi) and \(Double.pi) is the level of decimal precision. Double is more precise than Float."
