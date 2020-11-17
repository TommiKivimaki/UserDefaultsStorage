// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDefaultsStorage",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "UserDefaultsStorage",
            targets: ["UserDefaultsStorage"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UserDefaultsStorage",
            dependencies: []),
        .testTarget(
            name: "UserDefaultsStorageTests",
            dependencies: ["UserDefaultsStorage"]),
    ]
)
