// swift-tools-version: 6.0

import PackageDescription

var package = Package(name: "ReminderList")

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
  .package(
    name: "ReminderDetail",
    path: "../ReminderDetail"
  ),

]

package.products = [

  .library(
    name: "ReminderListInterface",
    targets: [
      "ReminderListInterface"
    ]
  ),
  .library(
    name: "ReminderList",
    targets: [
      "ReminderList"
    ]
  ),

]

package.targets = [

  .target(
    name: "ReminderListInterface",
    dependencies: [

      .product(
        name: "BuilderInterface",
        package: "Builder"
      )

    ],
    path: "Sources/Interface"
  ),
  .target(
    name: "ReminderList",
    dependencies: [

      "ReminderListInterface",
      .product(
        name: "BuilderInterface",
        package: "Builder"
      ),
      .product(
        name: "ReminderStoreInterface",
        package: "ReminderStore"
      ),
      .product(
        name: "ReminderDetailInterface",
        package: "ReminderDetail"
      )

    ],
    path: "Sources/Module",
    resources: [
      .process("Resources")
    ]
  ),

]
