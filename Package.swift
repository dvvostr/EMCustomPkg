// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EMCustomPkg",
    products: [
        .library(
            name: "EMCustomPkg",
            targets: ["EMCustomPkg"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/dvvostr/StudiqCore",
            branch: "main"
        ),
        .package(
            url: "https://github.com/dvvostr/StudiqUI",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "EMCustomPkg",
            dependencies: [
                "StudiqCore",
                "StudiqUI",
            ],
            resources: [Resource.process("Resources")]
        ),
        
    ]
)
