//
//

import Foundation

public protocol LayoutConstraintProviding {}

extension Kit.View: LayoutConstraintProviding {}

extension NSLayoutConstraint {
    public static func activate(@Builder<NSLayoutConstraint> constraints: () -> [NSLayoutConstraint]) {
        self.activate(constraints())
    }
}

extension LayoutConstraintProviding where Self: Kit.View {

    public func activate(@Builder<NSLayoutConstraint> constraints: (Self) -> [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints(self))
    }

    public func activate<Child: Kit.View>(_ value: Child, @Builder<NSLayoutConstraint> constraints: (Child, Self) -> [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints(value, self))
    }
}

@resultBuilder public struct Builder<Value> {
    public static func buildBlock() -> [Value] { [] }

    public static func buildBlock(_ components: Value...) -> [Value] {
        components
    }

    public static func buildBlock(_ components: Value?...) -> [Value] {
        components.compactMap { $0 }
    }
}
