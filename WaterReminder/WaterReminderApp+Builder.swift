//
// WaterReminderApp+Builder.swift
// WaterReminder
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface

import ReminderStoreInterface
import ReminderStore

import ReminderCreate
import ReminderList
import ReminderDetail
import Home

extension WaterReminderApp {

  func registerServices() {

    builder.register(Builder.self) { builder }

    builder.register(ReminderStoreProtocol.self) {

      guard
        let repository = try? DatabaseReminderRepository()
      else {
        preconditionFailure("Failure to create Database")
      }

      return ReminderStore(repository: repository)

    }

  }

  func registerFeatures() {

    builder.register(HomeRouteHandler())

    builder.register(ReminderListRouteHandler())

    builder.register(ReminderCreateRouteHandler())

    builder.register(ReminderDetailRouteHandler())

  }

}
