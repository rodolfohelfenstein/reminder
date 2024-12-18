//
// ReminderDetailPage.swift
// ReminderDetail
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import SwiftUI
import BuilderInterface
import ReminderStoreInterface

@MainActor
struct ReminderDetailPage {

  @Environment(\.dismiss) var dismiss

  let store: ReminderStoreProtocol

  let reminder: Reminder?

  init(
    store: ReminderStoreProtocol,
    reminderId: String
  ) {
    self.store = store
    self.reminder = store.reminders.first { $0.id == reminderId }
  }

  func didDeleteButtonTouched() {

    if let reminder {

      try? store.remove(reminder)

      dismiss()

    }

  }

}

extension ReminderDetailPage: View {

  var body: some View {

    VStack(
      spacing: 32.0
    ) {

      header

      form

      Spacer()

    }
    .padding(.vertical, 24.0)
    .padding(.horizontal, 16.0)

  }

  @ViewBuilder
  var header: some View {

    Text(
      "reminder-detail.page.title",
      bundle: .module
    )
    .font(.title)

  }

  @ViewBuilder
  var form: some View {
    VStack(
      spacing: 20.0
    ) {
      titleField
      timeField
      repeatField
      notificationField
      Spacer()
      submitButton
    }
  }

  @ViewBuilder
  var titleField: some View {
    TextField(
      text: Binding<String>(
        get: { reminder?.title ?? "-" },
        set: { _ in }
      )
    ) {
      Text(
        "reminder-detail.page.title.placeholder",
        bundle: .module
      )
    }
    .font(.title)
    .disabled(true)
  }

  @ViewBuilder
  var timeField: some View {
    DatePicker(
      selection: Binding<Date>(
        get: { reminder?.date ?? .now },
        set: { _ in }
      ),
      displayedComponents: .hourAndMinute
    ) {
      Label {
        Text(
          "reminder-detail.page.time-picker",
          bundle: .module
        )
      } icon: {
        Image(systemName: "clock")
          .foregroundStyle(.secondary)
      }
    }
    .disabled(true)
  }

  @ViewBuilder
  var repeatField: some View {
    Toggle(
      isOn: Binding<Bool>(
        get: { reminder?.isRepeatable ?? false },
        set: { _ in }
      )
    ) {
      Label {
        Text(
          "reminder-detail.page.repeat-toggle",
          bundle: .module
        )
      } icon: {
        Image(systemName: "repeat")
          .foregroundStyle(.secondary)
      }
    }
    .disabled(true)
  }

  @ViewBuilder
  var notificationField: some View {
    Toggle(
      isOn: Binding<Bool>(
        get: { reminder?.isNotifiable ?? false },
        set: { _ in }
      )
    ) {
      Label {
        Text(
          "reminder-detail.page.notification-toggle",
          bundle: .module
        )
      } icon: {
        Image(systemName: "bell")
          .foregroundStyle(.secondary)
      }
    }
    .disabled(true)
  }

  @ViewBuilder
  var submitButton: some View {
    Button(
      action: didDeleteButtonTouched
    ) {
      Text(
        "reminder-detail.page.button",
        bundle: .module
      )
      .frame(maxWidth: .infinity)
      .padding(.vertical, 8.0)
    }
    .buttonStyle(.borderedProminent)
    .tint(.red)
  }

}
