// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DMNumberSpellOutFormatter",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DMNumberSpellOutFormatter",
            targets: ["DMNumberSpellOutFormatter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.3.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DMNumberSpellOutFormatter",
            dependencies: [
                "SwiftSoup"
            ]),
        .testTarget(
            name: "DMNumberSpellOutFormatterTests",
            dependencies: [
                "SwiftSoup",
                "DMNumberSpellOutFormatter"
            ]),
    ]
)
