import Foundation

class Stack<T> {
    private var content: [T]
    private var top: T?
    init(content: [T]) {
        self.content = content
        self.top = content.last
    }
    init(add: T) {
        self.content = [add]
    }
    
}
