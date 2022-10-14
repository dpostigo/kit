//

//

#if canImport(UIKit)
import UIKit

extension NSLayoutConstraint {

    enum Anchor {
        case leading
        case trailing
        case top
        case bottom
        case centerX
        case centerY

        var closure: (UIView, UIView) -> [NSLayoutConstraint] {
            switch self {
                case .leading: return { [$0.leadingAnchor.constraint(equalTo: $1.leadingAnchor)] }
                case .trailing: return { [$0.trailingAnchor.constraint(equalTo: $1.trailingAnchor)] }
                case .top: return { [$0.topAnchor.constraint(equalTo: $1.topAnchor)] }
                case .bottom: return { [$0.bottomAnchor.constraint(equalTo: $1.bottomAnchor)] }
                case .centerX: return { [$0.centerXAnchor.constraint(equalTo: $1.centerXAnchor)] }
                case .centerY: return { [$0.centerYAnchor.constraint(equalTo: $1.centerYAnchor)] }
            }
        }
    }
}

extension UIView {

    public static var centerHorizontally: (UIView, UIView) -> [NSLayoutConstraint] = {
        [$0.centerXAnchor.constraint(equalTo: $1.centerXAnchor)]
    }

    public static var centerVertically: (UIView, UIView) -> [NSLayoutConstraint] = {
        [$0.centerYAnchor.constraint(equalTo: $1.centerYAnchor)]
    }

    public func center(
        _ child: UIView,
        horizontalAxis: (UIView, UIView) -> [NSLayoutConstraint] = UIView.centerHorizontally,
        verticalAxis: (UIView, UIView) -> [NSLayoutConstraint] = UIView.centerVertically
    ) {
        child.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(child)
        NSLayoutConstraint.activate(horizontalAxis(child, self) + verticalAxis(child, self))
    }

    public func add(
        _ child: UIView,
        leading: (UIView, UIView) -> NSLayoutConstraint = { $0.leadingAnchor.constraint(equalTo: $1.leadingAnchor) },
        trailing: (UIView, UIView) -> NSLayoutConstraint = { $0.trailingAnchor.constraint(equalTo: $1.trailingAnchor) },
        top: (UIView, UIView) -> NSLayoutConstraint = { $0.topAnchor.constraint(equalTo: $1.topAnchor) },
        bottom: (UIView, UIView) -> NSLayoutConstraint = { $0.bottomAnchor.constraint(equalTo: $1.bottomAnchor) }
    ) {
        child.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(child)
        NSLayoutConstraint.activate([
            leading(child, self),
            trailing(child, self),
            top(child, self),
            bottom(child, self)
        ])
    }
}

extension UIView {

    @discardableResult
    public func center(_ builder: () -> UIView) -> UIView {
        let child = builder()
        child.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(child)
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            child.topAnchor.constraint(equalTo: self.topAnchor),
            child.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        return self
    }
}

#endif