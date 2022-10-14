//
//

import Foundation

public protocol Bivalent: ExpressibleByArrayLiteral {
    associatedtype Value
    var primary: Value { get }
    var secondary: Value { get }
    init(primary: Value, secondary: Value)
}

extension Bivalent {
    init<T: Bivalent>(_ from: T) where T.Value == Self.Value {
        self.init(primary: from.primary, secondary: from.secondary)
    }

    public init(arrayLiteral elements: Value...) {
        assert(elements.count == 2)
        self.init(primary: elements[0], secondary: elements[1])
    }
}

public protocol CGFloatBivalent: Bivalent where Value == CGFloat {}


extension CGSize: CGFloatBivalent {
    public var primary: CGFloat { self.width }
    public var secondary: CGFloat { self.height }

    public init(primary: CGFloat, secondary: CGFloat) {
        self.init(width: primary, height: secondary)
    }
}

extension CGPoint: CGFloatBivalent {
    public var primary: CGFloat { self.x }
    public var secondary: CGFloat { self.y }

    public init(primary: CGFloat, secondary: CGFloat) {
        self.init(x: primary, y: secondary)
    }
}


extension CGFloatBivalent {

    public static func +<T: CGFloatBivalent>(lhs: Self, rhs: T) -> T {
        T.init(primary: lhs.primary + rhs.primary, secondary: lhs.secondary + rhs.secondary)
    }

    public static func -<T: CGFloatBivalent>(lhs: Self, rhs: T) -> T {
        T.init(primary: lhs.primary - rhs.primary, secondary: lhs.secondary - rhs.secondary)
    }

    public static func *<T: CGFloatBivalent>(lhs: Self, rhs: T) -> T {
        T.init(primary: lhs.primary * rhs.primary, secondary: lhs.secondary * rhs.secondary)
    }

    public static func /<T: CGFloatBivalent>(lhs: Self, rhs: T) -> T {
        T.init(primary: lhs.primary / rhs.primary, secondary: lhs.secondary / rhs.secondary)
    }

    public static func *(lhs: Self, rhs: CGFloat) -> Self {
        Self.init(primary: lhs.primary * rhs, secondary: lhs.secondary * rhs)
    }

    public static func /(lhs: Self, rhs: CGFloat) -> Self {
        Self.init(primary: lhs.primary / rhs, secondary: lhs.secondary / rhs)
    }
}
