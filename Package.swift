// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "TemperatureConverter",
    products: [
        .library(
            name: "TemperatureConverter",
            targets: ["TemperatureConverter"]
        )
    ],
    targets: [
        .target(
            name: "TemperatureConverter"
        ),
        .testTarget(
            name: "TemperatureConverterTests",
            dependencies: ["TemperatureConverter"]
        )
    ]
)
