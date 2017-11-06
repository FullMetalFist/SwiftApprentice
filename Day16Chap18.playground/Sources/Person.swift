import Foundation

public struct Person {
    let firstName: String
    let lastName: String
    public var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    public init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

open class ClassyPerson {
    let firstName: String
    let lastName: String
    open var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    public init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
// I peeked
