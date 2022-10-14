//
//

import SwiftUI

public enum Icon: Int, CaseIterable {
    case lock
    
    public struct Lock: Shape {
        public static let boundingBox = CGSize(width: 10, height: 14)
        
        public init() {
            
        }
        
        public func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addPath(
                Path { path in
                    path.move(to: CGPoint(x: 1, y: 3.7))
                    path.addCurve(to: CGPoint(x: 4.7, y: 0), control1: CGPoint(x: 1, y: 1.6), control2: CGPoint(x: 2.6, y: 0))
                    path.addLine(to: CGPoint(x: 5, y: 0))
                    path.addCurve(to: CGPoint(x: 9, y: 4), control1: CGPoint(x: 7.2, y: 0), control2: CGPoint(x: 9, y: 1.8))
                    path.addLine(to: CGPoint(x: 9, y: 6))
                    path.addLine(to: CGPoint(x: 9.3, y: 6))
                    path.addCurve(to: CGPoint(x: 10, y: 6.7), control1: CGPoint(x: 9.7, y: 6), control2: CGPoint(x: 10, y: 6.3))
                    path.addLine(to: CGPoint(x: 10, y: 13.3))
                    path.addCurve(to: CGPoint(x: 9.3, y: 14), control1: CGPoint(x: 10, y: 13.7), control2: CGPoint(x: 9.7, y: 14))
                    path.addLine(to: CGPoint(x: 0.7, y: 14))
                    path.addCurve(to: CGPoint(x: 0, y: 13.3), control1: CGPoint(x: 0.3, y: 14), control2: CGPoint(x: 0, y: 13.7))
                    path.addLine(to: CGPoint(x: 0, y: 6.7))
                    path.addCurve(to: CGPoint(x: 0.7, y: 6), control1: CGPoint(x: 0, y: 6.3), control2: CGPoint(x: 0.3, y: 6))
                    path.addLine(to: CGPoint(x: 1, y: 6))
                    path.addLine(to: CGPoint(x: 1, y: 3.7))
                    path.closeSubpath()
                }
            )
            
            path.addPath(
                Path { path in
                    path.move(to: CGPoint(x: 4.7, y: 1.3))
                    path.addLine(to: CGPoint(x: 5, y: 1.3))
                    path.addCurve(to: CGPoint(x: 7.7, y: 4), control1: CGPoint(x: 6.5, y: 1.3), control2: CGPoint(x: 7.7, y: 2.5))
                    path.addLine(to: CGPoint(x: 7.7, y: 5.7))
                    path.addLine(to: CGPoint(x: 2.3, y: 5.7))
                    path.addLine(to: CGPoint(x: 2.3, y: 3.7))
                    path.addCurve(to: CGPoint(x: 4.7, y: 1.3), control1: CGPoint(x: 2.3, y: 2.4), control2: CGPoint(x: 3.4, y: 1.3))
                    path.closeSubpath()
                }.reversed()
            )
            
            path.addPath(
                Path { path in
                    path.move(to: CGPoint(x: 8.3, y: 7.5))
                    path.addCurve(to: CGPoint(x: 8.3, y: 8.5), control1: CGPoint(x: 8.6, y: 7.8), control2: CGPoint(x: 8.6, y: 8.2))
                    path.addLine(to: CGPoint(x: 4.7, y: 12.2))
                    path.addCurve(to: CGPoint(x: 4.1, y: 12.4), control1: CGPoint(x: 4.5, y: 12.3), control2: CGPoint(x: 4.3, y: 12.4))
                    path.addCurve(to: CGPoint(x: 3.6, y: 12.2), control1: CGPoint(x: 3.9, y: 12.4), control2: CGPoint(x: 3.8, y: 12.3))
                    path.addLine(to: CGPoint(x: 1.9, y: 10.5))
                    path.addCurve(to: CGPoint(x: 1.9, y: 9.5), control1: CGPoint(x: 1.6, y: 10.2), control2: CGPoint(x: 1.6, y: 9.8))
                    path.addCurve(to: CGPoint(x: 3, y: 9.5), control1: CGPoint(x: 2.2, y: 9.2), control2: CGPoint(x: 2.7, y: 9.2))
                    path.addLine(to: CGPoint(x: 4.1, y: 10.6))
                    path.addLine(to: CGPoint(x: 7.3, y: 7.5))
                    path.addCurve(to: CGPoint(x: 8.3, y: 7.5), control1: CGPoint(x: 7.6, y: 7.2), control2: CGPoint(x: 8.1, y: 7.2))
                    path.closeSubpath()
                }.reversed()
            )
            
            let scale = rect.size / Self.boundingBox
            return path
                .applying(CGAffineTransform.identity.scaledBy(x: scale.width, y: scale.height))
            
        }
        
        @available(iOS 16, macOS 13.0, *)
        public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
            switch (proposal.width, proposal.height) {
                case (.some(let width), .some), (.some(let width), .none):
                    return CGSize(
                        width: width,
                        height: width * (Self.boundingBox.height / Self.boundingBox.width)
                    ).standardized
                    
                case (.none, .some(let height)):
                    return CGSize(
                        width: height * (Self.boundingBox.width / Self.boundingBox.height),
                        height: height
                    ).standardized
                default:
                    return Self.boundingBox
            }
        }
        
    }
    
}
