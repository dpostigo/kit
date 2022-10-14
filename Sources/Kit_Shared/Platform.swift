//
//

public enum Kit {}

public protocol KitProviding {
    associatedtype Color: ColorProviding
    associatedtype EdgeInsets
    associatedtype Image
    associatedtype LayoutPriority
    associatedtype View
    associatedtype BezierPath
}

public protocol ColorProviding: AnyObject {
    associatedtype Color: ColorProviding = Self
    static var blue: Color { get }
    func withAlphaComponent(_ alpha: CGFloat) -> Color
}

#if canImport(UIKit)
@_exported import UIKit

extension Kit: KitProviding {
    public typealias Color = UIKit.UIColor
    public typealias EdgeInsets = UIKit.UIEdgeInsets
    public typealias LayoutPriority = UIKit.UILayoutPriority
    public typealias View = UIKit.UIView
    public typealias Image = UIKit.UIImage
    public typealias BezierPath = UIKit.UIBezierPath
    
}

extension NSLayoutConstraint {
    public typealias Priority = UILayoutPriority
}


#endif

#if canImport(AppKit)
@_exported import AppKit

extension Kit: KitProviding {
    public typealias Color = AppKit.NSColor
    public typealias EdgeInsets = AppKit.NSEdgeInsets
    public typealias LayoutPriority = AppKit.NSLayoutConstraint.Priority
    public typealias View = AppKit.NSView
    public typealias Image = AppKit.NSImage
    public typealias BezierPath = AppKit.NSBezierPath
}
#endif


extension NSLayoutConstraint {
    public func priority(_ value: Kit.LayoutPriority) -> NSLayoutConstraint {
        priority = value
        return self
    }
}

extension Kit.LayoutPriority: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Float) {
        self.init(rawValue: value)
    }
}


extension Kit.Color: ColorProviding {}
