// swift-tools-version: 6.0

import PackageDescription

var package = Package(name: "ReminderCreate")

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
    name: "ReminderStore",
    path: "../ReminderStore"
  ),

]

package.products = [

  .library(
    name: "ReminderCreateInterface",
    targets: [
      "ReminderCreateInterface"
    ]
  ),
  .library(
    name: "ReminderCreate",
    targets: [
      "ReminderCreate"
    ]
  ),

]

package.targets = [

  .target(
    name: "ReminderCreateInterface",
    dependencies: [

      .product(
        name: "BuilderInterface",
        package: "Builder"
      )

    ],
    path: "Sources/Interface"
  ),
  .target(
    name: "ReminderCreate",
    dependencies: [

      "ReminderCreateInterface",
      .product(
        name: "BuilderInterface",
        package: "Builder"
      ),
      .product(
        name: "ReminderStoreInterface",
        package: "ReminderStore"
      )

    ],
    path: "Sources/Module",
    resources: [
      .process("Resources")
    ]
  ),

]
