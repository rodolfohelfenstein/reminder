//
// ReminderStoreProtocol.swift
// ReminderStoreInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import Foundation

public protocol ReminderStoreProtocol {

  var reminders: [Reminder] { get }

  func add(
    _ reminder: Reminder
  ) throws

  func remove(
    _ reminder: Reminder
  ) throws

}
