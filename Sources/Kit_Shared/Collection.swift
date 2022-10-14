//
//

import Foundation

extension Collection {
    public func elementAt(_ index: Self.Index) -> Element? {
        return index < self.endIndex ? self[index] : nil
    }
}

extension Sequence {
    public static func +(lhs: Self, rhs: Self.Element) -> [Self.Element] {
        lhs + [rhs]
    }
}

extension Sequence where Element: Equatable {
    public static func -(lhs: Self, rhs: Self) -> [Self.Element] {
        lhs.filter { !rhs.contains($0) }
    }
}

extension RangeReplaceableCollection {
    public static func +=(lhs: inout Self, rhs: Self.Element) {
        lhs.append(rhs)
    }
}

extension RangeReplaceableCollection where Element: Equatable {
    @discardableResult
    public mutating func remove(_ value: Element) -> Element? {
        self.firstIndex(of: value).map {
            self.remove(at: $0)
        }
    }
}

extension Array where Element: Hashable {
    public var unique: [Self.Element] { Array(Set(self)) }
}


extension Array where Element: Equatable {

    public static func -=(lhs: inout Self, rhs: Self.Element) {
        lhs -= [rhs]
    }

    public static func -=(lhs: inout Self, rhs: Self) {
        lhs.removeAll(where: { rhs.contains($0) })
    }
}
