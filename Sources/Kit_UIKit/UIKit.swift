//
//


#if canImport(UIKit)
import UIKit

@available(iOS 14.0, tvOS 14.0, *)
extension UIControl {
    public func addAction(_ controlEvents: UIControl.Event, action: () -> UIAction) {
        self.addAction(action(), for: controlEvents)
    }

    public func addAction(_ controlEvents: UIControl.Event, handler: @escaping UIActionHandler) {
        self.addAction(UIAction(handler: handler), for: controlEvents)
    }
}

extension UIView {
    public func addGesture(_ gesture: () -> UIGestureRecognizer) {
        self.addGestureRecognizer(gesture())
    }
    
    
    public func addGesture(@Builder _ gestures: () -> [UIGestureRecognizer]) {
        gestures().forEach { self.addGestureRecognizer($0) }
    }
    
    @resultBuilder public struct Builder {
        public static func buildBlock<T>(_ components: T...) -> [T] {
            components
        }
    }
}


#endif
