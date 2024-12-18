// swift-tools-version: 6.0

import PackageDescription

var package = Package(name: "Home")

package.defaultLocalization = "pt-BR"

package.platforms = [

  .iOS(.v17)

]

package.dependencies = [

  .package(
    name: "Builder",
    path: "../Builder"
  ),
  .package(
    name: "ReminderList",
    path: "../ReminderList"
  ),
  .package(
    name: "ReminderCreate",
    path: "../ReminderCreate"
  ),

]

package.products = [

  .library(
    name: "HomeInterface",
    targets: [
      "HomeInterface"
    ]
  ),
  .library(
    name: "Home",
    targets: [
      "Home"
    ]
  ),

]

package.targets = [

  .target(
    name: "HomeInterface",
    dependencies: [

      .product(
        name: "BuilderInterface",
        package: "Builder"
      )

    ],
    path: "Sources/Interface"
  ),
  .target(
    name: "Home",
    dependencies: [

      "HomeInterface",
      .product(
        name: "BuilderInterface",
        package: "Builder"
      ),
      .product(
        name: "ReminderListInterface",
        package: "ReminderList"
      ),
      .product(
        name: "ReminderCreateInterface",
        package: "ReminderCreate"
      ),

    ],
    path: "Sources/Module",
    resources: [
      .process("Resources")
    ]
  ),

]
