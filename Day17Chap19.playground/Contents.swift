/*
 Custom Operators, Subscripts, and Keypaths
 */

import Foundation

// custom operators

/*
 types of operators
 unary
 - work with one operand: prefix or postfix
 binary
 - work with two operands, infixes because they are between the operands ( + )
 ternary
 - work with three operands: conditional operator
 */

// exponentation operator

precedencegroup ExponentationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentationPrecedence

func **(base: Int, power: Int) -> Int {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

let base = 3
let exponent = 4
let result = base ** exponent

// compound assignment operator

infix operator **=

func **=(lhs: inout Int, rhs: Int) {
    lhs = lhs ** rhs
}

var number = 4
number **= exponent

// mini- exercises

// 1
func **(base: String, times: Int) -> String {
    precondition(times >= 1)
    var repeated = ""
    for _ in 1...times {
        repeated += base
    }
    return repeated
}

let baseString = "123"
let times = 7
var manyBase = baseString ** times

func **=(lhs: inout String, rhs: Int) {
    lhs = lhs ** rhs
}

var newBaseString = "a1b2c3"
let newTimes = 3
newBaseString **= newTimes

// generic operators

func **<T: BinaryInteger>(base: T, power: Int) -> T {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

func **=<T: BinaryInteger>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}

let unsignedBase: UInt = 4
let unsignedResult = unsignedBase ** exponent

let base8: Int8 = 2
let result8 = base8 ** exponent

let unsignedBase8: UInt8 = 2
let unsignedResult8 = unsignedBase8 ** exponent

let base16: Int16 = 4
let result16 = base16 ** exponent

let unsignedBase16: UInt16 = 4
let unsignedResult16 = unsignedBase16 ** exponent

let base32: Int32 = 8
let result32 = base32 ** exponent

let unsignedBase32: UInt32 = 8
let unsignedResult32 = unsignedBase32 ** exponent

let base64: Int64 = 16
let result64 = base64 ** exponent

let unsignedBase64: UInt64 = 16
let unsignedResult64 = unsignedBase64 ** exponent

// precedence and associativity

// subscripts (give your object dictionary like properties)

//subscript(parameterList) -> ReturnType {
//    get {
//        // return some value of ReturnType
//    }
//    set(newValue) {
//        // set some value of ReturnType to newValue
//    }
//}

class Person {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let cousin = Person(name: "Cousin", age: 30)

extension Person {
    subscript(key: String) -> String? {
        switch key {
        case "name":
            return name
        case "age":
            return "\(age)"
        default:
            return nil
        }
    }
}
cousin["name"]
cousin["age"]
cousin["gender"]

// subscript parameters, keypaths

class Tutorial {
    let title: String
    let author: Person
    
    let type: String
    let publishDate: Date
    
    init(title: String, author: Person, type: String, publishDate: Date) {
        self.title = title
        self.author = author
        self.type = type
        self.publishDate = publishDate
    }
}

let tutorial = Tutorial(title: "Object Oriented Programming in Objective-C", author: cousin, type: "Objective-C", publishDate: Date())

let title = \Tutorial.title
let tutorialTitle = tutorial[keyPath: title]

let authorName = \Tutorial.author.name
let tutorialAuthor = tutorial[keyPath: authorName]

// appending keypaths

let authorPath = \Tutorial.author
let authorNamePath = authorPath.appending(path: \.name)
let tutorialAuthorAppendedPath = tutorial[keyPath: authorNamePath]

// setting properties

class Jukebox {
    var song: String
    init(song: String) {
        self.song = song
    }
}

let jukebox = Jukebox(song: "In the End")
let song = \Jukebox.song
jukebox[keyPath: song] = "Stairway to Heaven"

/*
 Challenges
 */

// 1

extension Array {
    subscript(index: Int) -> (String, String)? {
        guard let value = self[index] as? Int else {
            return nil
        }
        
        switch (value >= 0, abs(value) % 2) {
        case (true, 0):
            return ("positive", "even")
        case (true, 1):
            return ("positive", "odd")
        case (false, 0):
            return ("negative", "even")
        case (false, 1):
            return ("negative", "odd")
        default:
            return nil
        }
    }
}

