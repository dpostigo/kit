//
//


import Foundation
import SwiftUI

extension EdgeInsets: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: CGFloat...) {
        assert(elements.count == 4)
        self.init(top: elements[0], leading: elements[1], bottom: elements[2], trailing: elements[3])
    }
}

#if os(iOS)
extension Path {
    public func reversed() -> Path {
        Path(Kit.BezierPath(cgPath: self.cgPath).reversing().cgPath)
    }
}
#endif
