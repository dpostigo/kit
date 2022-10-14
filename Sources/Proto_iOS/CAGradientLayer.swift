//
//

import Foundation

extension CAGradientLayer {
    public static func spliceHorizontalGradient(_ color: Kit.Color = .black) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.locations = [
            0.0,
            0.33,
            0.65,
            1.0
        ]
        layer.colors = [
            color.cgColor,
            color.withAlphaComponent(0.62).cgColor,
            color.withAlphaComponent(0.17).cgColor,
            color.withAlphaComponent(0.0).cgColor
        ]
        return layer
    }
    public static func spliceVerticalGradient(_ color: Kit.Color = .black) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 1.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.0)
        layer.locations = [
            0.0,
            0.19,
            0.36,
            0.6,
            0.82,
            1.0
        ]
        layer.colors = [
            color.cgColor,
            color.withAlphaComponent(0.86).cgColor,
            color.withAlphaComponent(0.64).cgColor,
            color.withAlphaComponent(0.20).cgColor,
            color.withAlphaComponent(0.0).cgColor,
            color.withAlphaComponent(0.0).cgColor
        ]
        return layer
    }

}

