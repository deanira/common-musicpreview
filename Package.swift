// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Common",
            targets: ["Common"]
        ),
    ],
    dependencies: [
      .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "20.0.0")),
      .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.12.2")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Common",
            dependencies: [
              .product(name: "RealmSwift", package: "realm-swift"),
              "Alamofire",
            ],
            resources: [.process("Resources")],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
        .testTarget(
            name: "CommonTests",
            dependencies: ["Common"],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
