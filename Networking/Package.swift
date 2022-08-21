// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Networking",
            type: .dynamic,
            targets: ["Networking"]
        ),
    ],
    dependencies: [
        .package(path: "../Dependencies"),
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: [],
            path: "./Networking"
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: [
                "Networking",
                .product(name: "Quick", package: "Dependencies"),
                .product(name: "Nimble", package: "Dependencies"),
            ],
            path: "./NetworkingTests"
        ),
    ]
)
