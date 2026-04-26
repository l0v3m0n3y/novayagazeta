// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "novayagazeta",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(name: "novayagazeta", targets: ["novayagazeta"]),
    ],
    targets: [
        .target(
            name: "novayagazeta",
            path: "src"
        ),
    ]
)
