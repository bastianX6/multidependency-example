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
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "5.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
        .package(url: "https://github.com/ashfurrow/Nimble-Snapshots.git", from: "9.0.0"),
    ],
    targets: [
        .target(
            name: "VideoDetail",
            dependencies: [
                "SDWebImageSwiftUI",
            ]
        ),
        .testTarget(
            name: "VideoDetailTests",
            dependencies: [
                "VideoDetail",
                "Quick",
                "Nimble",
                "Nimble-Snapshots",
            ]
        ),
    ]
)
