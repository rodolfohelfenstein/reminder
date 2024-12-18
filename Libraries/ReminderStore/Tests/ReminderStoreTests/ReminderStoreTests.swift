//
// ReminderStoreTests.swift
// ReminderStoreTests
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//

import Testing
@testable import ReminderStore
@testable import ReminderStoreInterface

@Suite("ReminderStoreTests")
struct ReminderStoreTests {

  @Test
  func testRead() async throws {

    // Mock

    let mock = try DatabaseReminderRepository(useInMemoryStore: true)

    // Given

    let sut = ReminderStore(repository: mock)

    // Then

    #expect(sut.reminders.isEmpty)

  }

  @Test
  func testSave() async throws {

    // Mock

    let mockRepository = try DatabaseReminderRepository(useInMemoryStore: true)

    let mockReminder = Reminder(
      title: "Testing",
      date: .now,
      isRepeatable: true,
      isNotifiable: true
    )

    // Given

    let sut = ReminderStore(repository: mockRepository)

    // Act

    sut.add(mockReminder)

    // Then

    #expect(sut.reminders.contains { $0.id == mockReminder.id })

  }

  @Test
  func testDelete() async throws {

    // Mock

    let mockRepository = try DatabaseReminderRepository(useInMemoryStore: true)

    let mockReminder = Reminder(
      title: "Testing",
      date: .now,
      isRepeatable: true,
      isNotifiable: true
    )

    // Given

    let sut = ReminderStore(repository: mockRepository)

    // Act

    sut.add(mockReminder)

    try #require(!mockRepository.read().isEmpty)

    sut.remove(mockReminder)

    // Then

    #expect(sut.reminders.isEmpty)

  }

}
