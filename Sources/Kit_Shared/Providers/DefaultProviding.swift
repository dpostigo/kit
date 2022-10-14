//
//

import Foundation

public protocol DefaultProviding {
    associatedtype Default = Self
    static var `default`: Default { get }
}

extension CaseIterable where Self.AllCases == [Self] {
    public static var first: Self? { Self.allCases.first }
}

extension CaseIterable where Self: DefaultProviding, Self.AllCases == [Self] {
    public static var `default`: Self? { Self.allCases.first }
}

extension RawRepresentable where Self: CaseIterable, Self.RawValue == Int, Self.AllCases == [Self] {
    public var next: Self? {
        let value = {
            switch self.rawValue {
                case Self.allCases.last?.rawValue:
                    return 0
                default: return self.rawValue + 1
            }
        }()
        return Self.init(rawValue: value)
    }
}
