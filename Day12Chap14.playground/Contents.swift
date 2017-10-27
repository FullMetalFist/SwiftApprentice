/*
 Advanced Classes
 */

// introducing inheritance

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}
class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
    }
}
var graduates: [String] = []
class Student: Person {
    var grades: [Grade] = []
    weak var partner: Student?
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
    deinit {
        graduates.append("\(lastName) \(firstName)")
    }
}

let luke = Person(firstName: "Luke", lastName: "Skywalker")
let leia = Student(firstName: "Leia", lastName: "Organa")
luke.firstName
leia.firstName

let diplomacy = Grade(letter: "A", points: 9.0, credits: 4.0)
leia.recordGrade(diplomacy) // luke does not have this function

class BandMember: Student {
    var minimumPracticeTimeInHours = 2
}
class AccordionPlayer: BandMember {
    override var minimumPracticeTimeInHours: Int {
        get {
            return super.minimumPracticeTimeInHours * 2
        }
        set {
            super.minimumPracticeTimeInHours = newValue / 2
        }
    }
}

// polymorphism

func phoneBookName(_ person: Person) -> String {
    return "\(person.lastName) \(person.firstName)"
}
let chewie = Person(firstName: "Chewbacca", lastName: "Chewbacca")
let han = AccordionPlayer(firstName: "Han", lastName: "Solo")
phoneBookName(chewie)
phoneBookName(han)

// runtime hierarchy checks

var hallMonitor = Student(firstName: "Darth", lastName: "Vader")
//hallMonitor = han   // still only a 'student', not 'accordion player'

(han as Student)    // downcast to 'student'
(hallMonitor as? BandMember)?.minimumPracticeTimeInHours    // nil
//(hallMonitor as! BandMember).minimumPracticeTimeInHours   // crash

if let newHallMonitor = hallMonitor as? BandMember {
    print("This hall monitor is a band member and practices at least \(newHallMonitor.minimumPracticeTimeInHours) hours per week")
}

func afterSchool(with student: Student) -> String {
    return "Going home!"
}
func afterSchool(with student: BandMember) -> String {
    return "Going to practice!"
}
afterSchool(with: leia)
afterSchool(with: han)

// inheritance, methods, and overrides

class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    var sports: [String]
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        super.init(firstName: firstName, lastName: lastName)    // enforced rule
        recordGrade(passGrade)
    }
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    var isEligible: Bool {
        return failedClasses.count < 3
    }
}

// introducing super, when to call super, preventing inheritance

final class SuperStudent: Person { }
//class SuperStudentAthlete: SuperStudent { } // build error

class ExchangeStudent: Person {
    final func recordGrade(_ grade: Grade) { }
}
class ExchangeStudentAthlete: Person {
//    override func recordGrade(_ grade: Grade) { }   // build error
}

// inheritance and class initialization

// two-phase initialization
//  initialize all stored properties in the class inheritance

// mini-exercise
// person does not have a superclass to call, unlike the others

// required and convenience initializers (seems to blow up this playground)

// mini-exercise, create two more convenience initializers on Student. Which other initializers are you able to call? (person init, another convenience init

// when and why to subclass, Single Responsibility Principle

// strong types

class Team {
    var players: [StudentAthlete] = []
    var isEligible: Bool {
        for player in players {
            if !player.isEligible {
                return false
            }
        }
        return true
    }
}

// shared base classes

class Button {
    func press() { }
}
class Image { }

class ImageButton: Button {
    var image: Image
    init(image: Image) {
        self.image = image
    }
}

class TextButton: Button {
    var text: String
    init(text: String) {
        self.text = text
    }
}

// extensibility, identity, understanding the class lifecycle, deinitialization

// retain cycles and weak references

var minsoo = Student(firstName: "Minsoo", lastName: "Kim")
var soomin = Student(firstName: "Soomin", lastName: "Kang")
minsoo.partner = soomin
soomin.partner = minsoo
//minsoo = nil        // nil cannot be assigned to type 'Student'
//soomin = nil

/*
 Challenges
 */

// 1

class A {
    init() {
        print("I'm a")
    }
    deinit {
        print("deinit a")
    }
}
class B: A {
    override init() {
        print("I'm b")
        super.init()
        print("I'm b")
    }
    deinit {
        print("deinit b")
    }
}
class C: B {
    override init() {
        print("I'm c")
        super.init()
        print("I'm c")
    }
    deinit {
        print("deinit c")
    }
}

var c: C? = C()
/*
 I'm c
 I'm b
 I'm a
 I'm b
 I'm c
*/

// 2

// 3

let ac = c as! A    // need '!' to downcast
c = nil

// 4

class StudentBaseballPlayer: StudentAthlete {
    var position: String
    var number: Int
    var battingAverage: Double
    init(firstName: String, lastName: String, sports: [String], position: String, number: Int, battingAverage: Double) {
        self.position = position
        self.number = number
        self.battingAverage = battingAverage
        let sportsWithBaseball = ["Baseball"] + sports
        super.init(firstName: firstName, lastName: lastName, sports: sportsWithBaseball)
    }
}
