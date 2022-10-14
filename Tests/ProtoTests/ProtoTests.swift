import XCTest
@testable import Proto

final class ProtoTests: XCTestCase {
    func testExample() throws {
        

        var image = UIImage(systemName: "checkmark.lock.fill")
        
        Swift.print("image = \(image)")
        
    }
}
import struct Swift.DefaultStringInterpolation

extension DefaultStringInterpolation {
    public mutating func appendInterpolation<T>(optional: T?) {
        if let optional = optional {
            appendInterpolation(optional)
        }
    }
}
