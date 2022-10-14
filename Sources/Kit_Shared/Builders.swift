//
//

import Foundation

extension Array {
    public init(@Kit.Builder builder: () -> [Element]) {
        self.init(builder())
    }
}


extension Kit {
    @resultBuilder public enum Builder {
        public static func buildBlock<T>(_ components: T...) -> [T] {
            components
        }
    }
}
