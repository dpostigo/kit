//
//

import CoreGraphics

extension CGSize {
    public var standardized: CGSize {
        CGRect(origin: .zero, size: self).standardized.size
    }
}
