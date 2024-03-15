// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "E-Commerce",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/mongodb/mongo-swift-driver.git", from: 7.0.0),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "E-Commerce",
            dependencies: ["MongoSwift"]),
    ],
    platforms: [ .iOS(.v12) ]
)
