//
//

#if canImport(UIKit)
import UIKit

extension UIViewPropertyAnimator {
    public func completeAnimation() {
        if !self.isRunning {
            self.startAnimation()
        }
        self.stopAnimation(false)
        self.finishAnimation(at: .end)
    }
}

public class LinkedAnimator: UIViewPropertyAnimator {
    public var next: UIViewPropertyAnimator?
    
    public func complete() {
        self.addCompletion { [weak self] _ in
            let next = self?.next
            self?.next = nil
            
            switch next {
                case let next as LinkedAnimator:
                    next.complete()
                default:
                    next?.completeAnimation()
            }
        }
        self.completeAnimation()
    }
    
    public func addAnimator(_ next: @escaping () -> UIViewPropertyAnimator) {
        self.addCompletion { [weak self] _ in
            let next = next()
            self?.next = next
            next.startAnimation()
        }
    }
}

#endif
