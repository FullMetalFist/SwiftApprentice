import Foundation

class Stack<T> {
    private var content: [T]
    private var top: T = content.last
    init(content: [T]) {
        self.content = content
    }
    init(add: T) {
        self.content = [add]
    }
    
}
