//
// ReminderStore.swift
// ReminderStore
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import ReminderStoreInterface
import UserNotifications
import Observation

@Observable
public final class ReminderStore: ReminderStoreProtocol {

  @ObservationIgnored
  private let repository: ReminderRepositoryProtocol

  public var reminders: Reminders

  public init(
    repository: ReminderRepositoryProtocol
  ) {

    self.repository = repository

    self.reminders = repository.read()

  }

  public func add(
    _ reminder: Reminder
  ) {

    try? self.repository.save(reminder)

    self.reminders = repository.read()

  }

  public func remove(
    _ reminder: Reminder 
  ) {

    try? self.repository.delete(reminder)

    self.reminders = repository.read()

  }

}
