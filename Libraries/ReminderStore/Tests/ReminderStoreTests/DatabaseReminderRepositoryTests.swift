//
// DatabaseReminderRepositoryTests.swift
// ReminderStoreTests
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//
  
import Testing
@testable import ReminderStore
@testable import ReminderStoreInterface

@Suite("DatabaseReminderRepositoryTests")
struct DatabaseReminderRepositoryTests {

  @Test
  func testRead() async throws {

    // Given

    let sut = try DatabaseReminderRepository(useInMemoryStore: true)

    // Act

    let reminders = sut.read()

    // Then

    #expect(reminders.isEmpty)

  }

  @Test
  func testSave() async throws {

    // Given

    let sut = try DatabaseReminderRepository(useInMemoryStore: true)

    // Mock

    let mock = Reminder(
      title: "Testing",
      date: .now,
      isRepeatable: true,
      isNotifiable: true
    )

    // Act

    try sut.save(mock)

    // Then

    let reminders = sut.read()

    #expect(reminders.contains { $0.id == mock.id} )

  }

  @Test
  func testDelete() async throws {

    // Given

    let sut = try DatabaseReminderRepository(useInMemoryStore: true)

    // Mock

    let mock = Reminder(
      title: "Testing",
      date: .now,
      isRepeatable: true,
      isNotifiable: true
    )

    // Act

    try #require(sut.read().isEmpty)

    try sut.save(mock)

    try #require(!sut.read().isEmpty)

    try sut.delete(mock)

    // Then
    
    #expect(sut.read().isEmpty)

  }

}
