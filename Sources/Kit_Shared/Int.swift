//
//

import Foundation

extension Int {
    public var times: Range<Int> { (0 ..< self) }

    public var titles: [String] { self.times.map { "Item \($0)" } }

    public func values<T>(_ transform: (Int) throws -> T) rethrows -> [T] {
        try self.times.map(transform)
    }

    public func times<T>(_ transform: () throws -> T) rethrows -> [T] {
        try self.times.map { _ in try transform() }
    }
}
