//
// ReminderData.swift
// ReminderStore
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//

import SwiftData
import Foundation
import ReminderStoreInterface

@Model
final class ReminderData {

  @Attribute(.unique)
  var id: String

  var title: String

  var date: Date

  var isRepeatable: Bool

  var isNotifiable: Bool

  init(
    id: String,
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

extension ReminderData {

  convenience init(
    _ reminder: Reminder
  ) {
    self.init(
      id: reminder.id,
      title: reminder.title,
      date: reminder.date,
      isRepeatable: reminder.isRepeatable,
      isNotifiable: reminder.isNotifiable
    )
  }

}

extension ReminderData {

  func toDomain() -> Reminder {
    Reminder(
      id: id,
      title: title,
      date: date,
      isRepeatable: isRepeatable,
      isNotifiable: isNotifiable
    )
  }

}
