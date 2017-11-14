/*
 Pattern Matching
 */

let coordinate = (x:1, y:0, z:0)

// 1
if (coordinate.y == 0) && (coordinate.z == 0) {
    print("along the x axis")
}

// 2
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
