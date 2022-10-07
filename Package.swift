// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "state-dto",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "StateDTO",
            targets: ["StateDTO"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/yaslab/ULID.swift.git", .upToNextMinor(from: "1.2.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "StateDTO",
            dependencies: []),
        .testTarget(
            name: "StateDTOTests",
            dependencies: [.target(name: "StateDTO")]),
    ]
)
