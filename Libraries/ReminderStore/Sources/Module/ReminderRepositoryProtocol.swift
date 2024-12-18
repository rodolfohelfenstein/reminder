//
// ReminderReposistory.swift
// ReminderStore
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//
    
import ReminderStoreInterface
import Foundation

public protocol ReminderRepositoryProtocol {

  func read() -> Reminders

  func save(_ reminder: Reminder) throws

  func delete(_ reminder: Reminder) throws

}
