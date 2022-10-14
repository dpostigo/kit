

public protocol PathImplementing {
    var string: String { get }
    
}

extension PathImplementing {
    public var listing: [String] {
        return (try? FileManager.default.contentsOfDirectory(atPath: self.string)) ?? []
    }
}

#if canImport(PackagePlugin)
import PackagePlugin


extension Path: PathImplementing { }

#endif

