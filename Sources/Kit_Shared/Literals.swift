//
//

import Foundation
import CoreGraphics

extension CGRect: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: CGFloat...) {
        assert(elements.count == 4)
        self.init(x: elements[0], y: elements[1], width: elements[2], height: elements[3])
    }
}

extension Kit.LayoutPriority: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(rawValue: Float(value))
    }
}

extension Kit.EdgeInsets: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: CGFloat...) {
        assert(elements.count == 4)
        self.init(top: elements[0], left: elements[1], bottom: elements[2], right: elements[3])
    }
}
