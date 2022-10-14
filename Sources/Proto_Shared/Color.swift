//
//

import Foundation

extension ColorProviding where Self.Color == Self {
    public static var shade: Color { Self.blue.withAlphaComponent(0.2) }
}
