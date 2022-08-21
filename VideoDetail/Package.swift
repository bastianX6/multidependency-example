// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "VideoDetail",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "VideoDetail",
            type: .dynamic,
            targets: ["VideoDetail"]
        ),
    ],
    dependencies: [
        .package(path: "../Dependencies"),
    ],
    targets: [
        .target(
            name: "VideoDetail",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "Dependencies"),
                .product(name: "SDWebImage", package: "Dependencies"),
            ]
        ),
        .testTarget(
            name: "VideoDetailTests",
            dependencies: [
                "VideoDetail",
                .product(name: "Quick", package: "Dependencies"),
                .product(name: "Nimble", package: "Dependencies"),
                .product(name: "Nimble-Snapshots", package: "Dependencies"),
            ]
        ),
    ]
)
