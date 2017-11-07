import Foundation

public class Logger {
    
    public static let sharedInstance = Logger()
    public func log() {
        print("something")
    }
    private init() {
        print("Logger made")
    }
}
