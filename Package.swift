// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CLMooncellData",
    platforms: [.iOS(.v10), .macOS(.v10_12)],
    products: [
        .library(
            name: "CLMooncellData",
            targets: ["CLMooncellData"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0-rc.3"),
    ],
    targets: [
        .target(
            name: "CLMooncellData",
            dependencies: ["Kanna", "Alamofire"]),
        .testTarget(
            name: "CLMooncellDataTests",
            dependencies: ["CLMooncellData"]),
    ]
)
