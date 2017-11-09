/*
 Custom Operators, Subscripts, and Keypaths
 */

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

infix operator **

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

