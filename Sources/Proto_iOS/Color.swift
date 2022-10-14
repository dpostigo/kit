//
//

import Foundation

extension Kit.View {
    public func shade() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = Kit.Color.blue.cgColor
        self.backgroundColor = Kit.Color.blue.withAlphaComponent(0.2)
    }
}
