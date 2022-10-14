//
//

extension RawRepresentable where Self: Identifiable {
    public var id: Self.RawValue { self.rawValue }
}
