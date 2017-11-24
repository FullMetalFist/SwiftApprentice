/*
 Value Types and Value Semantics
 */

// value types vs reference types

// reference types

struct Color: CustomStringConvertible {
    var red, green, blue: Double
    var description: String {
        return "r: \(red), g: \(green), b: \(blue)"
    }
}

// preset colors
extension Color {
    static var black = Color(red: 0, green: 0, blue: 0)
    static var white = Color(red: 1, green: 1, blue: 1)
    static var blue = Color(red: 0, green: 0, blue: 1)
    static var green = Color(red: 0, green: 1, blue: 0)
    static var red = Color(red: 1, green: 0, blue: 0)
}

// paint bucket abstraction
class Bucket {
    var color: Color
    var isRefilled = false
    init(color: Color) {
        self.color = color
    }
    func refill() {
        isRefilled = true
    }
}

let azurePaint = Bucket(color: .blue)
let wallBluePaint = azurePaint
wallBluePaint.isRefilled
azurePaint.refill()             // change this one
wallBluePaint.isRefilled        // effects here

// value types

extension Color {
    mutating func darken() {
        red *= 0.9; green *= 0.9; blue *= 0.9
    }
}

var azure = Color.blue
var wallBlue = azure
azure
wallBlue.darken()               // darken this one
azure                           // does not effect here


// defining value semantics, when to prefer value semantics

// implementing value semantics, case 1: primitive value types, case 2: composite value types, case 3: reference types, case 4: value types containing mutable reference types

// copy-on-write to the rescue, beyond copy-on-write

// recipies for value semantics

/*
 Challenges
 */

// 1

//private class Pixels {
//    let storageBuffer: UnsafeMutableBufferPointer<UInt8>
//    init(size: Int, value: UInt8) {
//        let p = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: size)  // error: type 'UnsafeMutableBufferPointer<UInt8>' has no member 'allocate'
//        storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: size)
//        storageBuffer.initialize(from: repeatElement(value, count: size))
//    }
//    
//    init(pixels: Pixels) {
//        let otherStorage = pixels.storageBuffer
//        let p = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: otherStorage.count)    // error: type 'UnsafeMutableBufferPointer<UInt8>' has no member 'allocate'
//        storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: otherStorage.count)
//        storageBuffer.initialize(from: otherStorage)
//    }
//    subscript(offset: Int) -> UInt8 {
//        get {
//            return storageBuffer[offset]
//        }
//        set {
//            storageBuffer[offset] = newValue
//        }
//    }
//    deinit {
//        storageBuffer.baseAddress!.deallocate(capacity: self.storageBuffer.count)
//    }
//}


