//
//

import Foundation

extension ColorProviding where Self.Color == Self {
    public static var shade: Color { Self.blue.withAlphaComponent(0.2) }
}



extension Kit.View {
    public func shade() {
        self.layer?.borderWidth = 1.0
        self.layer?.borderColor = Kit.Color.blue.cgColor
        self.layer?.backgroundColor = Kit.Color.blue.withAlphaComponent(0.2).cgColor
    }
}
