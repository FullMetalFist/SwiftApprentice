/*
 Structures
 */

let restaurantLocation = (2, 3)
let restaurantRange = 1.5

let newRestaurantLocation = (7, 4)
let newRestaurantRange = 1.0

// pythagorean theorem
func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    let newDeliveryDistance = distance(from: location, to: newRestaurantLocation)
    return deliveryDistance < restaurantRange || newDeliveryDistance < newRestaurantRange
}

struct Location {
    let x: Int
    let y: Int
}
let storeLocation = Location(x: 5, y: 9)

struct DeliveryArea {
    let center: Location
    var radius: Double
}

var storeArea = DeliveryArea(center: storeLocation, radius: 3)

// mini-exercise

//struct PizzaOrder {
//    let crust: String
//    let cheese: Bool
//    let size: String
//    let pepperoni: Bool
//    let sausage: Bool
//    let peppers: Bool
//    let onions: Bool
//    let anchovies: Bool
//}
//
//let glutenFreeLargeCheesePizza = PizzaOrder(crust: "Gluten-free", cheese: true, size: "Large", pepperoni: false, sausage: false, peppers: false, onions: false, anchovies: false)

// accessing members

print(storeArea.radius)
print(storeArea.center.y)

storeArea.radius = 300

var fixedArea = DeliveryArea(center: storeLocation, radius: 3)
fixedArea.radius = 250

// mini-exercise
func distance(from source: Location, to target: Location) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: Location) -> Bool {
    let deliveryDistance = distance(from: (location.x, location.y), to: (storeArea.center.x, storeArea.center.y))
    return deliveryDistance < restaurantRange
}

// introducing methods

let areas = [
    DeliveryArea(center: Location(x: 3, y: 5), radius: 3.2),
    DeliveryArea(center: Location(x: 9, y: 8), radius: 2.1)
]

func isInDeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: (area.center.x, area.center.y), to: (location.x, location.y))
        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 3, y: 3)

print(isInDeliveryRange(customerLocation1))
print(isInDeliveryRange(customerLocation2))

//func contains(_ location: Location) -> Bool {
//    let distanceFromCenter = distance(from: (center.x, center.y), to: (location.x, location.y))
//    return distanceFromCenter < radius
//}

// mini-exercises
import Foundation

func distanceUsingStruct(from: Location, to: Location) -> Double {
    let distanceX = Double(from.x - to.x)
    let distanceY = Double(from.y - to.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func containsUsingStruct(_ location: Location, radius: Double) -> Bool {
    let distanceFromCenter = distanceUsingStruct(from: location, to: location)
    return distanceFromCenter < radius
}

func overlaps(_ area: DeliveryArea, with: DeliveryArea) -> Bool {
    let radiiSubtractionSquared = pow((area.radius - with.radius), 2)
    let distanceX = Double(area.center.x - with.center.x)
    let distanceY = Double(area.center.y - with.center.y)
    let distanceSquared = pow((distanceX * distanceX + distanceY * distanceY), 2)
    let radiiAdditionSquared = pow((area.radius + with.radius), 2)
    if (radiiSubtractionSquared <= distanceSquared) && (distanceSquared <= radiiAdditionSquared) {
        return true
    }
    return false
}

// structures as values

var a = 7
var b = a
print(a)
print(b)

a = 20
print(a)
print(b)        // copy on assignment

var area1 = DeliveryArea(center: Location(x: 3, y: 15), radius: 4)
var area2 = area1
print(area1.radius)
print(area2.radius)

area1.radius = 20
print(area1.radius)
print(area2.radius)

// struct all over, conforming to protocols
// public struct Int : FixedWidthInteger, SignedInteger {
//      ....
// }

// public protocol CustomStringConvertible {
// // a text representation of this instance
// public var description: String { get }

struct DeliveryArea: CustomStringConvertible {
    let center: Location
    var radius: Double
    
    var description: String {
        return """
        Area with center x: \(center.x) - y: \(center.y), radius: \(radius),
        """
    }
    
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter = distanceUsingStruct(from: center, to: location)
        return distanceFromCenter < radius
    }
}
print(area1)
print(area2)


/*
 Challenges
 */

// 1
typealias BoardPiece = String
let X: BoardPiece = "X"
let O: BoardPiece = "O"

struct Position {
    let x = Int
    let y = Int
}
