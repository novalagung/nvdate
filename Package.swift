// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NVDate",
    platforms: [
        .iOS("7.0"),
        .macOS("10.9"),
        .tvOS("9.0"),
        .watchOS("2.0")
    ],
    products: [
        .library(
            name: "NVDate",
            targets: ["NVDate"]
        )
    ],
    targets: [
        .target(
            name: "NVDate",
            path: ".",
            exclude: [
                "Examples",
                "LICENSE",
                "NVDate.podspec",
                "README.md",
                "coverage.lcov",
                "NVDate.h"
            ],
            sources: [
                "NVDate.m"
            ],
            publicHeadersPath: "include"
        )
    ]
)
