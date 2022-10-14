//
//

import SwiftUI

#if canImport(SwiftUI)
extension AnyView {
    public init<Content: View>(@ViewBuilder content: @escaping () -> Content) {
        self.init(content())
    }

    public var name: String? {
        Mirror(reflecting: self).descendant("storage", "view").map { String(describing: type(of: $0)) }
    }
}

#endif
extension View {
    public var name: String? {  String(describing: type(of: self)) }

    @ViewBuilder public func isHidden(_ hidden: Binding<Bool>) -> some View {
        if hidden.wrappedValue { self.hidden() } else { self }
    }
}

public func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

extension Color {
    public init(@Kit.Builder builder: () -> Kit.Color) {
        self.init(builder())
    }
}
