//
//


#if canImport(UIKit)
import UIKit

public class Action: NSObject {
    open var handler: (Action) -> Void
    open weak var sender: AnyObject?

    init(handler: @escaping (Action) -> Void, sender: AnyObject? = nil) {
        self.handler = handler
        self.sender = sender
        super.init()
    }

    @objc fileprivate func execute() {
        self.handler(self)
    }
}

private var UIActionReplacementKey: UInt8 = 0

public protocol UIActionSupporting: NSObject {

}

extension UIActionSupporting {
    var primaryAction: Action? {
        get { objc_getAssociatedObject(self, &UIActionReplacementKey) as? Action }
        set {
            objc_setAssociatedObject(self, &UIActionReplacementKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    @discardableResult public func setAction(_ action: Action) -> Self {
        self.primaryAction = action
        return self
    }

    @discardableResult public func setAction(handler: @escaping (Action) -> Void) -> Self {
        self.setAction(Action(handler: handler, sender: self))
        return self
    }
}

extension UIGestureRecognizer: UIActionSupporting {
    public convenience init(action: Action) {
        self.init(target: action, action: #selector(action.execute))
        self.primaryAction = action
        action.sender = self
    }

    public convenience init(handler: @escaping (Action) -> Void) {
        self.init(action: Action(handler: handler))
    }
}

#endif
