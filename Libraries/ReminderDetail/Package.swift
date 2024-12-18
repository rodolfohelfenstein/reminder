// swift-tools-version: 6.0

import PackageDescription

var package = Package(name: "ReminderDetail")

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
    name: "ReminderDetailInterface",
    targets: [
      "ReminderDetailInterface"
    ]
  ),
  .library(
    name: "ReminderDetail",
    targets: [
      "ReminderDetail"
    ]
  ),

]

package.targets = [

  .target(
    name: "ReminderDetailInterface",
    dependencies: [

      .product(
        name: "BuilderInterface",
        package: "Builder"
      )

    ],
    path: "Sources/Interface"
  ),
  .target(
    name: "ReminderDetail",
    dependencies: [

      "ReminderDetailInterface",
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
