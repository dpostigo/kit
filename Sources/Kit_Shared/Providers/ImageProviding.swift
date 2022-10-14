//
//

public protocol ImageProviding {
    var image: Kit.Image? { get }
}

public protocol ImageConvertible: ImageProviding {
    var image: Kit.Image? { get }
    var imageProviding: ImageProviding? { get }
}

extension ImageConvertible {
    public var image: Kit.Image? { self.imageProviding?.image }
    public var imageProviding: ImageProviding? { self }
}

