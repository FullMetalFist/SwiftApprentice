/*
 Classes
 */

// creating classes

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
let misterDude = Person(firstName: "Mister", lastName: "Dude")

// reference types

class SimplePerson {
    let name: String
    init(name: String) {
        self.name = name
    }
}
let reyMysterio = SimplePerson(name: "Rey Mysterio")
var reyMysterio2 = reyMysterio

// heap vs stack, working with references

// mini-exercise

var anotherDude = misterDude
anotherDude.firstName = "Another"

misterDude.firstName

// object identity

let imposterDude = Person(firstName: "Imposter", lastName: "Dude")
misterDude === anotherDude
misterDude === imposterDude
imposterDude === anotherDude

anotherDude = imposterDude
misterDude === anotherDude

anotherDude = misterDude
misterDude === anotherDude

var imposters = (0...100).map { _ in
    Person(firstName: "Imposter", lastName: "Dude")
}
imposters.contains {
    $0.firstName == imposterDude.firstName && $0.lastName == imposterDude.lastName
}

imposters.contains {
    $0 === imposterDude
}
import Foundation

imposters.insert(imposterDude, at: Int(arc4random_uniform(100)))
imposters.contains {
    $0 === imposterDude
}
if let indexOfDude = imposters.index(where: {$0 === imposterDude}) {
    imposters[indexOfDude].lastName = "Terrific"
}
imposterDude.fullName

// mini-exercise

func memberOf(person: Person, group: [Person]) -> Bool {
    for target in group {
        if person === target {
            return true
        }
    }
    return false
}

let redGuy = Person(firstName: "Red", lastName: "Guy")
let blueGuy = Person(firstName: "Blue", lastName: "Guy")
var allRed = (0...4).map { _ in
    redGuy
}

var oneBlue = [redGuy, redGuy, blueGuy, redGuy, redGuy]

memberOf(person: blueGuy, group: allRed)
memberOf(person: blueGuy, group: oneBlue)

// methods and mutability

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    var credits = 0.0
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
        credits += grade.credits
    }
}

let farquhar = Student(firstName: "Farquhar", lastName: "Farquhar")
let calculus = Grade(letter: "B", points: 9.0, credits: 3.0)
let philosophy = Grade(letter: "A", points: 16.0, credits: 4.0)
farquhar.recordGrade(calculus)
farquhar.recordGrade(philosophy)

// mutability and constants

// mini-exercise

class MiniExerciseStudent {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
    func giveGPA() -> Double {
        var gpa = 0.0
        if self.grades.isEmpty {
            return gpa
        } else {
            var points: Double = 0
            var credits: Double = 0
            for g in self.grades {
                credits += g.credits
                points += g.points
            }
            gpa = points / credits
        }
        return gpa
    }
}

let kumquat = MiniExerciseStudent(firstName: "Kumquat", lastName: "Kumquat")
let statistics = Grade(letter: "A", points: 12.0, credits: 3.0)
let art = Grade(letter: "B", points: 9.0, credits: 3.0)
kumquat.grades.append(statistics)
kumquat.grades.append(art)
kumquat.giveGPA()

// understand state and side effects, extending class using an extension

extension Student {
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

// when to use a class versus a struct, values vs objects, speed, minimalist approach

/*
 Challenges
 */

// 1

class List {
    var name: String
    var titles: [String]
    init(name: String, titles: [String]) {
        self.name = name
        self.titles = titles
    }
    func print() {
        // print all the movies in the list
    }
}

class User {
    
    func addList(_ list: List) {
        // adds the given list to a dictionary of List objects
    }
    func list(forName: String) -> List? {
        // return the list for the provided name
        return nil
    }
}

// create 2 users and have them create and share lists. Have the users modify the same list and call print for both users are all changes reflected?
// what happens when they are changed to structs?
