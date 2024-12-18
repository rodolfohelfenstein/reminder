// swift-tools-version: 6.0

import PackageDescription

var package = Package(name: "Builder")

package.defaultLocalization = "pt-BR"

package.platforms = [

  .iOS(.v17),

]

package.products = [

  .library(
    name: "BuilderInterface",
    targets: [
      "BuilderInterface"
    ]
  ),
  .library(
    name: "Builder",
    targets: [
      "Builder"
    ]
  ),

]

package.targets = [

  .target(
    name: "BuilderInterface",
    path: "Sources/Interface"
  ),
  .target(
    name: "Builder",
    dependencies: [
      "BuilderInterface"
    ],
    path: "Sources/Module"
  ),

]
