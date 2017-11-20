/*
 Error Handling
 */

// error protocol

class Pastry {
    let flavor: String
    var numberOnHand: Int
    init(flavor: String, numberOnHand: Int) {
        self.flavor = flavor
        self.numberOnHand = numberOnHand
    }
}

enum BakeryError: Error {
    case tooFew(numberOnHand: Int)
    case doNotSell
    case wrongFlavor
}

// throwing errors

class Bakery {
    var itemsForSale = [
        "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
        "PopTart": Pastry(flavor: "Berry", numberOnHand: 15),
        "Donut": Pastry(flavor: "ChocolateGlazed", numberOnHand: 24),
        "HandPie": Pastry(flavor: "Cherry", numberOnHand: 5)
    ]
    func orderPastry(item: String, amountRequested: Int, flavor: String) throws -> Int {
        guard let pastry = itemsForSale[item] else {
            throw BakeryError.doNotSell
        }
        guard flavor == pastry.flavor else {
            throw BakeryError.wrongFlavor
        }
        guard amountRequested <= pastry.numberOnHand else {
            throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
        }
        pastry.numberOnHand -= amountRequested
        return pastry.numberOnHand
    }
}

let bakery = Bakery()
do {
    try bakery.orderPastry(item: "Pigeon", amountRequested: 1, flavor: "Pigeon")
} catch BakeryError.doNotSell {
    print("item not here")
} catch BakeryError.wrongFlavor {
    print("flavor not available")
} catch BakeryError.tooFew {
    print("don't have enough")
}

//bakery.orderPastry(item: "Pigeon", amountRequested: 1, flavor: "Pigeon")

// handling errors, not looking at the detailed error

let remaining = try? bakery.orderPastry(item: "Pigeon", amountRequested: 1, flavor: "Pigeon")

// stopping your program on an error

do {
    try bakery.orderPastry(item: "Cookie", amountRequested: 1, flavor: "ChocolateChip")
} catch {
    fatalError()
}

// same as force-unwrapping optionals
try! bakery.orderPastry(item: "Cookie", amountRequested: 1, flavor: "ChocolateChip")

// advanced error handling

enum Direction {
    case left
    case right
    case forward
}
enum PugBotError: Error {
    case invalidMove(found: Direction, expected: Direction)
    case endOfPath
}
class PugBot {
    let name: String
    let correctPath: [Direction]
    private var currentStepInPath = 0
    init(name: String, correctPath: [Direction]) {
        self.correctPath = correctPath
        self.name = name
    }
    func turnLeft() throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == .left else {
            throw PugBotError.invalidMove(found: .left, expected: nextDirection)
        }
        currentStepInPath += 1
    }
    func turnRight() throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == .right else {
            throw PugBotError.invalidMove(found: .right, expected: nextDirection)
        }
        currentStepInPath += 1
    }
    func moveForward() throws {
        guard currentStepInPath < correctPath.count else {
            throw PugBotError.endOfPath
        }
        let nextDirection = correctPath[currentStepInPath]
        guard nextDirection == .forward else {
            throw PugBotError.invalidMove(found: .forward, expected: nextDirection)
        }
        currentStepInPath += 1
    }
    func reset() {
        currentStepInPath = 0
    }
}

let pugBot = PugBot(name: "PugBot", correctPath: [.forward, .left, .forward, .right])
func goHome() throws {
    try pugBot.moveForward()
    try pugBot.turnLeft()
    try pugBot.moveForward()
    try pugBot.turnRight()
}
do {
    try goHome()
} catch {
    print("PugBot did not make it home")
}

// handling multiple errors

func moveSafely(_ movement: () throws -> ()) -> String {
    do {
        try movement()
        return "Completed successfully"
    } catch PugBotError.invalidMove(let found, let expected) {
        return "PugBot was supposed to move \(expected), but moved \(found)"
    } catch PugBotError.endOfPath {
        return "PugBot tried to move past the end of the path"
    } catch {
        return "An unknown error occurred"
    }
}

pugBot.reset()
moveSafely(goHome)

pugBot.reset()
moveSafely {
    try pugBot.moveForward()
    try pugBot.turnLeft()
    try pugBot.moveForward()
    try pugBot.turnRight()
}

// rethrows

func perform(times: Int, movement: () throws -> ()) rethrows {
    for _ in 1...times {
        try movement()
    }
}

/*
 Challenges
 */

// 1
//import UIKit
import CoreGraphics

extension CGAffineTransform {
    var isInvertable: Bool {
        return abs(a*d - b*c) > CGFloat.ulpOfOne
    }
}
CGAffineTransform().isInvertable
CGAffineTransform.identity.isInvertable

extension CGAffineTransform: CustomStringConvertible {
    public var description: String {
        return [a,b,c,d,tx,ty].reduce("") { $0 + "\($1)"}
    }
    func saveInverted() -> CGAffineTransform? {
        if self.isInvertable {
            return self.inverted()
        }
        return nil
    }
}

let scaleByTwo = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
scaleByTwo.isInvertable
scaleByTwo.saveInverted()

let scaleBySomething = CGAffineTransform.identity.scaledBy(x: 4, y: 2)
scaleBySomething.isInvertable
scaleBySomething.saveInverted()

// 2
var savedInversion: CGAffineTransform = scaleBySomething

if let tempInversion = scaleBySomething.saveInverted() {
    savedInversion = tempInversion
}

savedInversion.saveInverted()

// 3
extension CGAffineTransform {
    func checkInverted() throws {
        
        // 
    }
}

