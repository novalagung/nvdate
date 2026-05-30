// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NVDate",
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
