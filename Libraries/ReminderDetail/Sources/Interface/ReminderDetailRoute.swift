//
// ReminderDetailRoute.swift
// ReminderDetailInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//

import BuilderInterface

public struct ReminderDetailRoute: Route {

  public static let identifier: String = "reminder-detail"

  public let reminderId: String

  public init(
    _ reminderId: String
  ) {
    self.reminderId = reminderId
  }

}
