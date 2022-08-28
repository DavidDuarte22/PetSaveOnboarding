// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of
// Swift required to build this package.

import PackageDescription

let package = Package(
  // The name of the Swift package goes here.
  name: "PetSaveOnboarding",
  // Define the platforms you want your Swift package to work on.
  platforms: [.iOS(.v15), .macOS(.v10_15)],
  // It defines the library or executables a Swift package produces. It also makes it available to other apps and packages.
  products: [
    .library(
    name: "PetSaveOnboarding",
    targets: ["PetSaveOnboarding"]),
  ],
  // Add any third-party frameworks the Swift package depends on.
  dependencies: [],
  // It defines the target of the Swift package. It may also define other test targets or packages this target depends on.
  targets: [
    .target(
    name: "PetSaveOnboarding",
    resources: [.copy("Resources/Assets.xcassets")]),
  ]
)
