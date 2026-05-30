// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NVDate",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v12),
        .watchOS(.v4),
    ],
    products: [
        .library(
            name: "NVDate",
            targets: ["NVDate"]
        ),
    ],
    targets: [
        .target(
            name: "NVDate",
            path: ".",
            exclude: [
                ".github",
                ".gitignore",
                "coverage.json",
                "coverage.lcov",
                "LICENSE",
                "NVDate.podspec",
                "README.md",
                "Examples",
                "test.sh",
                "Tests",
            ],
            sources: ["NVDate.swift"]
        ),
        .testTarget(
            name: "NVDateTests",
            dependencies: ["NVDate"],
            path: "Tests/NVDateTests"
        ),
    ]
)
