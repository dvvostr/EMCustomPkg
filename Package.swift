// swift-tools-version: 5.7
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
        .package(url: "https://github.com/zvonicek/ImageSlideshow", .upToNextMajor(from: "1.9.1")),
        .package(url: "https://github.com/ElaWorkshop/TagListView", .upToNextMajor(from: "1.4.1")),
    ],
    targets: [
        .target(
            name: "EMCustomPkg",
            dependencies: [
                "StudiqCore",
                "StudiqUI",
                .product(name: "ImageSlideshow", package: "ImageSlideshow"),
                .product(name: "TagListView", package: "TagListView"),
            ],
            resources: [Resource.process("Resources")]
        ),
        
    ]
)
