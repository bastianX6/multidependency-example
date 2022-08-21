// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Dependencies",
    products: [
        .library(
            name: "Dependencies",
            targets: ["Dependencies"]
        ),
        .library(
            name: "iOSSnapshotTestCase",
            targets: ["FBSnapshotTestCase"]
        ),
        .library(
            name: "Nimble",
            targets: ["Nimble"]
        ),
        .library(
            name: "Nimble-Snapshots",
            targets: ["Nimble_Snapshots"]
        ),
        .library(
            name: "Quick",
            targets: ["Quick"]
        ),
        .library(
            name: "SDWebImage",
            targets: ["SDWebImage"]
        ),
        .library(
            name: "SDWebImageSwiftUI",
            targets: ["SDWebImageSwiftUI"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Dependencies",
            dependencies: []
        ),
        .binaryTarget(name: "FBSnapshotTestCase",
                      path: "../PodBuilder/Prebuilt/iOSSnapshotTestCase/FBSnapshotTestCase.xcframework"),
        .binaryTarget(name: "Nimble",
                      path: "../PodBuilder/Prebuilt/Nimble/Nimble.xcframework"),
        .binaryTarget(name: "Nimble_Snapshots",
                      path: "../PodBuilder/Prebuilt/Nimble-Snapshots/Nimble_Snapshots.xcframework"),
        .binaryTarget(name: "Quick",
                      path: "../PodBuilder/Prebuilt/Quick/Quick.xcframework"),
        .binaryTarget(name: "SDWebImage",
                      path: "../PodBuilder/Prebuilt/SDWebImage/SDWebImage.xcframework"),
        .binaryTarget(name: "SDWebImageSwiftUI",
                      path: "../PodBuilder/Prebuilt/SDWebImageSwiftUI/SDWebImageSwiftUI.xcframework"),
    ]
)
