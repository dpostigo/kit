// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Kit",
    platforms: [
        .iOS(.v13),
        .macOS(.v12)
    ],
    products: [
        .library( name: "Kit", targets: ["Kit"] ),
        .library( name: "Proto", targets: ["Proto"] ),
    ],
    dependencies: [
        .package(url: "https://github.com/alexito4/Flow", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [

        .target(
            name: "Kit",
            dependencies: [
                .target(name: "Kit_iOS", condition: .when(platforms: [.iOS])),
                .target(name: "Kit_macOS", condition: .when(platforms: [.macOS])),
                .target(name: "Kit_SwiftUI"),
            ]
        ),
        .target(name: "Kit_Shared", dependencies: [.product(name: "Flow", package: "flow")]),
        .target(name: "Kit_UIKit", dependencies: ["Kit_Shared"]),
        .target(name: "Kit_iOS", dependencies: ["Kit_UIKit"]),
        .target(name: "Kit_macOS", dependencies: ["Kit_Shared"]),
        .target(name: "Kit_SwiftUI", dependencies: ["Kit_Shared"]),

        .testTarget(
            name: "KitTests",
            dependencies: ["Kit"]
        ),

        .target(name: "Proto_Shared", dependencies: ["Kit"]),
        .target(name: "Proto_iOS", dependencies: ["Proto_Shared"]),
        .target(name: "Proto_macOS", dependencies: ["Proto_Shared"]),
        .target(
            name: "Proto",
            dependencies: [
                .target(name: "Proto_iOS", condition: .when(platforms: [.iOS])),
                .target(name: "Proto_macOS", condition: .when(platforms: [.macOS]))
            ]
        ),
        .testTarget(
            name: "ProtoTests",
            dependencies: ["Proto"]
        )

    ]
)
