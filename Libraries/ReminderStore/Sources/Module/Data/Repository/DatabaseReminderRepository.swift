//
// DatabaseReminderRepository.swift
// ReminderStore
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//

import ReminderStoreInterface
import Foundation
import SwiftData

public final class DatabaseReminderRepository {

  let container: ModelContainer

  public init(
    useInMemoryStore: Bool = false
  ) throws {

    let configuration = ModelConfiguration(
      for: ReminderData.self,
      isStoredInMemoryOnly: useInMemoryStore
    )

    container = try ModelContainer(
      for: ReminderData.self,
      configurations: configuration
    )

  }

}

extension DatabaseReminderRepository: ReminderRepositoryProtocol {

  public func read() -> Reminders {

    let context = ModelContext(container)

    let fetchDescriptor = FetchDescriptor<ReminderData>()

    let result = try? context.fetch(fetchDescriptor)

    return result?.compactMap { $0.toDomain() } ?? []

  }

  public func save(
    _ reminder: Reminder
  ) throws {

    let data = ReminderData(reminder)

    let context = ModelContext(container)

    context.insert(data)

    try context.save()

  }

  public func delete(
    _ reminder: Reminder
  ) throws {

    let id = reminder.id

    let context = ModelContext(container)

    try context
      .delete(
        model: ReminderData.self,
        where: #Predicate { $0.id == id }
      )

    try context.save()

  }

}
