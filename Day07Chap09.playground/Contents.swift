/*
 Strings
 */

// strings as collections
let string = "Michael"

for char in string {
    print(char)
}

let stringLength = string.count

//let secondChar = string[1]

let cafeNormal = "café"
let cafeCombo = "cafe\u{0301}"

cafeNormal.count
cafeCombo.count

cafeNormal.unicodeScalars.count
cafeCombo.unicodeScalars.count

for codePoint in cafeCombo.unicodeScalars {
    print(codePoint.value)
}

// indexing strings

let firstIndex = cafeCombo.startIndex
let firstChar = cafeCombo[firstIndex]
let anotherFirstChar = string[firstIndex]

// let lastIndex = cafeCombo.endIndex
// let finalChar = cafeCombo[lastIndex] // causes error

let lastIndex = cafeCombo.index(before: cafeCombo.endIndex)
let finalChar = cafeCombo[lastIndex]
// let anotherFinalChar = string[lastIndex] // not gonna work

let fourthIndex = cafeCombo.index(cafeCombo.startIndex, offsetBy: 3)
let fourthChar = cafeCombo[fourthIndex]
// let anotherFourthChar = string[fourthIndex] // not gonna work

fourthChar.unicodeScalars.count
fourthChar.unicodeScalars.forEach {
    codePoint in
    print(codePoint.value)
}   // weird, receiving error here

let equal = cafeNormal == cafeCombo

// strings as bi-directional collections
let name = string
let backwardsName = name.reversed()

let secondCharIndex = backwardsName.index(backwardsName.startIndex, offsetBy: 1)
let secondChar = backwardsName[secondCharIndex]

let backwardsNameString = String(backwardsName)

// substrings

let fullName = "Michael Vilabrera"
let spaceIndex = fullName.index(of: " ")!
let firstName = fullName[fullName.startIndex..<spaceIndex]
let lastName = fullName[fullName.index(after: spaceIndex)...]

let lastNameString = String(lastName)
let lastNameVerify = lastName == lastNameString // interesting how RW mentioned 'lastName' is of type 'substring'

// encoding, UTF-8 // uses code-units

let char = "\u{00bd}"
for i in char.utf8 {
    print(i)
}

let charGroup = "+\u{00bd}\u{21e8}\u{1f643}"
for i in charGroup.utf8 {
    print("\(i): \(String(i, radix:2))")
}

// utf-16 // uses surrogate pairs

for i in charGroup.utf16 {
    print("\(i): \(String(i, radix: 2))")
}

// converting indexes between encoding views

let arrowIndex = charGroup.index(of: "\u{21e8}")!
charGroup[arrowIndex]

if let unicodeScalarsIndex = arrowIndex.samePosition(in: charGroup.unicodeScalars) {
    charGroup.unicodeScalars[unicodeScalarsIndex]
}

if let utf8Index = arrowIndex.samePosition(in: charGroup.utf8) {
    charGroup.utf8[utf8Index]
}

if let utf16Index = arrowIndex.samePosition(in: charGroup.utf16) {
    charGroup.utf16[utf16Index]
}

/*
 Challenges
 */

// 1

func reverseString(string: String) {
    var reverseMe = string
    while reverseMe != "" {
        let finalIndex = reverseMe.index(before: reverseMe.endIndex)
        print(reverseMe[finalIndex])
        reverseMe.removeLast()
    }
}

reverseString(string: "Dude")

// 2

// easy way -  check for a space and return the number of words with spaces between
// difficult way (edge cases) - check that character is not special, not a double space, not a space then the end
func howManyWordsInMy(string: String) -> Int {
    var count = 1
    for char in string {
        if char == " " {
            count += 1
        }
    }
    return count
}
let challengeString2 = "It is a beautiful day"
howManyWordsInMy(string: challengeString2)

// 3

func flipLastFirstName(fullName: String) -> String {
    let commaIndex = fullName.index(of: ",")!
    let spaceIndex = fullName.index(of: " ")!
    let firstName = fullName[fullName.index(after: spaceIndex)...]
    let lastName = fullName[fullName.startIndex..<commaIndex]
    
    return firstName + " " + lastName
}

let lastNameFirst = "Vilabrera, Michael"
let firstNameFirst = flipLastFirstName(fullName: lastNameFirst)

// 4 // for NSString, not String
import Foundation
let test: NSString = "this is a test, just a test"
let group = test.components(separatedBy: "i")


func componentsComparison(wholeString: String, separatedBy separator: String) -> [String] {
    var temp: [String] = []
    for i in wholeString {
        
    }
    return temp
}

// 5
func flipEachWord(wholeString: String) -> String {
    var temp = ""
    
    return temp
}
