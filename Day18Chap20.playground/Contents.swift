/*
 Pattern Matching
 */

let coordinate = (x:1, y:0, z:0)

// 1
if (coordinate.y == 0) && (coordinate.z == 0) {
    print("along the x axis")
}

// 2, a wild card
if case (_, 0, 0) = coordinate {
    print("along the x axis")
}

// introducing patterns, basic pattern matching

// if and guard

//func process(point: (x: Int, y: Int, z: Int)) -> String {
//    if case (0, 0, 0) = point {
//        return "At origin"
//    }
//    return "Not at origin"
//}
//
//let point = (x: 0, y: 0, z: 0)
//let response = process(point: point)

//func process(point: (x: Int, y: Int, z: Int)) -> String {
//    guard case (0, 0, 0) = point else {
//        return "Not at origin"
//    }
//    return "At origin"
//}
//
//let point = (x: 0, y: 0, z: 0)
//let response = process(point: point)

// switch

//func process(point: (x: Int, y: Int, z: Int)) -> String {
//    let closeRange = -2...2
//    let midRange = -5...5
//    
//    switch point {
//    case (0, 0, 0):
//        return "At origin"
//    case (closeRange, closeRange, closeRange):
//        return "At close range"
//    case (midRange, midRange, midRange):
//        return "At mid range"
//    default:
//        "Not near origin"
//    }
//}
//
//let point = (x: 2, y: 5, z: 3)
//let response = process(point: point)

func population(with: UInt) -> String {
    
    switch with {
    case 1:
        return "Single"
    case 2...5:
        return "A few"
    case 6...10:
        return "Several"
    default:
        return "Many"
    }
    return "None"
}

population(with: 50)
population(with: 9)



/*
 source:
 https://github.com/zemirco/swift-timeago/blob/master/swift-timeago/TimeAgo.swift
 */

import Foundation

func timeAgoSince(_ timeInterval: TimeInterval) -> String {
    
    let date = Date(timeIntervalSince1970: timeInterval)
    let calendar = Calendar.current
    let now = Date()
    let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
    let components = (calendar as NSCalendar).components(unitFlags, from: date, to: now, options: [])
    
    if let year = components.year, year >= 2 {
        return "\(year) years ago"
    }
    
    if let year = components.year, year >= 1 {
        return "Last year"
    }
    
    if let month = components.month, month >= 2 {
        return "\(month) months ago"
    }
    
    if let month = components.month, month >= 1 {
        return "Last month"
    }
    
    if let week = components.weekOfYear, week >= 2 {
        return "\(week) weeks ago"
    }
    
    if let week = components.weekOfYear, week >= 1 {
        return "Last week"
    }
    
    if let day = components.day, day >= 2 {
        return "\(day) days ago"
    }
    
    if let day = components.day, day >= 1 {
        return "Yesterday"
    }
    
    if let hour = components.hour, hour >= 2 {
        return "\(hour) hours ago"
    }
    
    if let hour = components.hour, hour >= 1 {
        return "An hour ago"
    }
    
    if let minute = components.minute, minute >= 2 {
        return "\(minute) minutes ago"
    }
    
    if let minute = components.minute, minute >= 1 {
        return "A minute ago"
    }
    
    if let second = components.second, second >= 3 {
        return "\(second) seconds ago"
    }
    
    return "Just now"
    
}

timeAgoSince(1510497408.0)

// for

let groupSizes = [1, 5, 4, 6, 2, 1, 3]
for case 1 in groupSizes {
    print("Found an individual")
}

// patterns, wild card, value binding

if case (let x, 0, 0) = coordinate {
    print("On the x-axis at \(x)")
}

if case let (x, y, 0) = coordinate {
    print("On the x-y plane at (\(x), \(y))")
}

// identifier pattern, tuple pattern, enumeration case pattern

enum Direction {
    case north, south, east, west
}

let heading = Direction.north

if case .north = heading {
    print("Bring a hat!")
}

enum Organism {
    case plant
    case animal(legs: Int)
}

let pet = Organism.animal(legs: 0)

switch pet {
case .animal(let legs):
    if legs < 1 {
        print("possibly a fish?")
    } else {
        print("potentially cuddly with \(legs) legs")
    }
default:
    print("no chance for cuddles")
}

// mini-exercise

let names: [String?] = ["Michelle", nil, "Brandon", "Christine", nil, "David"]

for name in names {
    if let realName = name {        // unclear regarding pattern matching content if this is appropriate
        print(realName)
    }
}

// optional pattern

for case let name? in names {
    print(name)
}

// "is" type-casting pattern

let array: [Any] = [15, "String", 32]

for element in array {
    switch element {
    case is String:
        print("found a string")
    default:
        print("found something else")
    }
}

// "as" type-casting pattern

for element in array {
    switch element {
    case let text as String:
        print("Found a string: \(text)")
    default:
        print("Found something else")
    }
}

// advanced patterns, qualifying with where

for number in 1...9 {
    switch number {
    case let x where x % 2 == 0 :
        print("even")
    default:
        print("odd")
    }
}

enum LevelStatus {
    case complete
    case inProgress(percent: Double)
    case notStarted
}

let levels: [LevelStatus] = [.complete, .inProgress(percent: 0.99), .notStarted]

for level in levels {
    switch level {
    case .inProgress(let percent) where percent > 0.8:
        print("almost done!")
    case .inProgress(let percent) where percent > 0.5:
        print("halfway there!")
    case .inProgress(let percent) where percent > 0.2:
        print("great start!")
    default:
        break
    }
}

