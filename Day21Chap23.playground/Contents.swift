/*
 Asynchronous clousures and Memory Management
 */

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// reference cycles for classes

class Tutorial {
    let title: String
    unowned let author: Author
    weak var editor: Editor?
    
    lazy var createDescription: () -> String = {
        [unowned self] in
        return "\(self.title) by \(self.author.name)"
    }
    
    init(title: String, author: Author) {
        self.title = title
        self.author = author
    }
    deinit {
        print("Farewell Tutorial \(title)")
    }
}
class Editor {
    let name: String
    var tutorials: [Tutorial] = []
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Farewell Editor \(name)")
    }
}
class Author {
    let name: String
    var tutorials: [Tutorial] = []
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Farewell Author \(name)")
    }
}

do {
    let author = Author(name: "Cosmo")
    let tutorial: Tutorial = Tutorial(title: "Something", author: author)
    let editor: Editor = Editor(name: "Dude")
    tutorial.editor = editor
    editor.tutorials.append(tutorial)
    print(tutorial.createDescription())
}

// weak references, unowned references

// reference cycles for closures, capture lists

var counter = 0
var closure = { print(counter) }
counter = 1
closure()

counter = 0
closure = { [counter] in print(counter) }
counter = 1
closure()

// unowned self

// handling asynchronous closures, GCD

func log(message: String) {
    let thread = Thread.current.isMainThread ? "Main" : "Background"
    print("\(thread) thread: \(message)")
}
func addNumbers(upTo range: Int) -> Int {
    log(message: "Adding numbers")
    return (1...range).reduce(0, +)
}
let queue = DispatchQueue(label: "queue")
func execute<Result>(backgroundWork: @escaping() -> Result, mainWork: @escaping (Result) -> ()) {
    queue.async {
        let result = backgroundWork()
        DispatchQueue.main.async {
            mainWork(result)
        }
    }
}

execute(backgroundWork: { addNumbers(upTo: 1000) }, mainWork: { log(message: "The sum is \($0)") })

// weak self

extension Editor {
    func feedback(for tutorial: Tutorial) -> String {
        let tutorialStatus: String
        if arc4random_uniform(10) % 2 == 0 {
            tutorialStatus = "published"
        } else {
            tutorialStatus = "rejected"
        }
        return "Tutorial \(tutorialStatus) by \(self.name)"
    }
    func editTutorial(_ tutorial: Tutorial) {
        queue.async {
//            [unowned self] in
//            let feedback = self.feedback(for: tutorial)
//            DispatchQueue.main.async {
//                print(feedback)
//            }
            [weak self] in
            guard let strongSelf = self else {
                print("No longer exist!"); return
            }
            DispatchQueue.main.async {
                print(strongSelf.feedback(for: tutorial))
            }
        }
    }
}

/*
 Challenges
 */

// 1
class Person {
    let name: String
    let email: String
    weak var car: Car?
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    deinit {
        print("Later, \(name)")
    }
}
class Car {
    let id: Int
    let type: String
    weak var owner: Person?
    init(id: Int, type: String) {
        self.id = id
        self.type = type
    }
    deinit {
        print("Bye, \(type)")
    }
}
do {
    var owner: Person? = Person(name: "Cosmo", email: "kramer@kramer.net")
    var car: Car? = Car(id: 4, type: "Chevy")
    owner?.car = car
    car?.owner = owner
    owner = nil
    car = nil
}

// 2
class Customer {
    let name: String
    let email: String
    weak var account: Account?
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    deinit {
        print("Later \(name)")
    }
}
class Account {
    let number: Int
    let type: String
    let customer: Customer
    init(number: Int, type: String, customer: Customer) {
        self.number = number
        self.type = type
        self.customer = customer
    }
    deinit {
        print("Farewell \(customer) account # \(number)")
    }
}
do {
    var customer: Customer? = Customer(name: "Costanza", email: "cantstandya@yahoo.com")
    var account: Account? = Account(number: 10, type: "Amex", customer: customer!)
    customer?.account = account
    account = nil
    customer = nil
}
