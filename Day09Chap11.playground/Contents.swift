/*
 Properties
 */

struct Car {
    let make: String
    let color: String
}

// stored properties

struct Contact {
    var fullName: String
    let emailAddress: String    //var emailAddress: String
    var address: String
    var type = "Friend"
}

var topherGrace = Contact(fullName: "Topher Grace", emailAddress: "aDude@t.net", address: "123 Palo Alto Drive, CA, US", type: "Actor")

let name = topherGrace.fullName
let email = topherGrace.emailAddress
let address = topherGrace.address

topherGrace.fullName = "Christopher John 'Topher' Grace"
let updatedName = topherGrace.fullName

// immutable, 'let'!
// topherGrace.emailAddress = "updated@t.net"

// computed properties

struct TV {
    var height: Double
    var width: Double
    
    // 1
    var diagonal: Int {
        get {
            // 2
            let result = (height * height + width * width).squareRoot().rounded()
            // 3
            return Int(result)
        }
        set {
            // 3
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            // 4
            let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv: TV = TV(height: 53.93, width: 95.87)
let size = tv.diagonal

tv.width = tv.height
let newSize = tv.diagonal

let compMonitor = TV(height: 13.75, width: 9.48)
let compSize = compMonitor.diagonal

tv.diagonal = 70
let tvHeight = tv.height
let tvWidth = tv.width

// type properties, property observers

// level cannot be constructed because it has no accessible initializers
//struct Level {
//    static var highestLevel = 1
//    let id: Int
//    var boss: String
//    var unlocked: Bool {
//        didSet {
//            if unlocked && id > Level.highestLevel {
//                Level.highestLevel = id
//            }
//        }
//    }
//    let level1 = Level(id: 1, boss: "Ant", unlocked: true)
//    let level2 = Level(id: 2, boss: "Mouse", unlocked: false)
//    let level3 = Level(id: 3, boss: "Pigeon", unlocked: false)
//    let level4 = Level(id: 4, boss: "Cat", unlocked: false)
//}

// let highestLevel = Level.highestLevel       // the only way to work with this property

// limiting a variable

struct LightBulb {
    static let maxCurrent = 40
    var current = 0 {
        didSet {
            if current > LightBulb.maxCurrent {
                print("Current too high, falling back to previous setting")
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
var current = light.current = 30
current = light.current = 50

// mini-exercise

struct LightBulbToo {
    static let maxCurrent = 40
    var current = 0 {
        willSet {
            if current > LightBulb.maxCurrent {
                print("Saving the bulb by turning it off")
            } else {
                current = newValue
            }
        }
    }
}

// lazy properties

import Foundation

struct Circle {
    lazy var pi = {
        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    var radius = 0.0
    var circumference: Double {
        mutating get {
            return pi * radius * 2
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5)  // circle but no pi
let circumference = circle.circumference


