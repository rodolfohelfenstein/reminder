// swift-tools-version: 6.0

import PackageDescription

var package = Package(name: "ReminderStore")

package.defaultLocalization = "pt-BR"

package.platforms = [

  .iOS(.v17)

]

package.products = [

  .library(
    name: "ReminderStoreInterface",
    targets: [
      "ReminderStoreInterface"
    ]
  ),
  .library(
    name: "ReminderStore",
    targets: [
      "ReminderStore"
    ]
  ),

]

package.targets = [

  .target(
    name: "ReminderStoreInterface",
    path: "Sources/Interface"
  ),
  .target(
    name: "ReminderStore",
    dependencies: [
      "ReminderStoreInterface"
    ],
    path: "Sources/Module"
  ),
  .testTarget(
    name: "ReminderStoreTests",
    dependencies: [
      "ReminderStore"
    ]
  )

]
