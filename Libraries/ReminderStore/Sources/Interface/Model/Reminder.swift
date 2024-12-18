//
// Reminder.swift
// ReminderStore
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import Foundation

public struct Reminder: Sendable, Identifiable {

  public let id: String
  public let title: String
  public let date: Date
  public let isRepeatable: Bool
  public let isNotifiable: Bool

  public init(
    id: String = UUID().uuidString,
    title: String,
    date: Date,
    isRepeatable: Bool,
    isNotifiable: Bool
  ) {
    self.id = id
    self.title = title
    self.date = date
    self.isRepeatable = isRepeatable
    self.isNotifiable = isNotifiable
  }

}

public typealias Reminders = [Reminder]
