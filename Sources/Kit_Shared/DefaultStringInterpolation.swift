//
//

import struct Swift.DefaultStringInterpolation

extension DefaultStringInterpolation {
    public mutating func appendInterpolation<T>(optional: T?) {
        if let optional = optional {
            appendInterpolation(optional)
        }
    }
}
