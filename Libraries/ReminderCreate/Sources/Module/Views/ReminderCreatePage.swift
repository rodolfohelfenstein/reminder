//
// ReminderCreatePage.swift
// ReminderCreate
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import SwiftUI
import BuilderInterface
import ReminderStoreInterface

@MainActor
struct ReminderCreatePage {

  @Environment(\.dismiss) var dismiss

  let store: ReminderStoreProtocol

  @State var title: String			= "Novo lembrete"
  @State var date: Date					= .now
  @State var isRepeatable: Bool	= false
  @State var isNotifiable: Bool = false

  @FocusState var isTitleFocused: Bool

  func didCreateButtonTouched() {

    let reminder = Reminder(
      title: title,
      date: date,
      isRepeatable: isRepeatable,
      isNotifiable: isNotifiable
    )

    do {

      try store.add(reminder)

      dismiss()

    } catch {
      
    }

  }

}

extension ReminderCreatePage: View {

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
    .onAppear {
      isTitleFocused = true
    }

  }

  @ViewBuilder
  var header: some View {

    Text(
      "reminder-create.page.title",
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
      text: $title
    ) {
      Text(
        "reminder-create.page.title.placeholder",
        bundle: .module
      )
    }
    .font(.title)
    .focused($isTitleFocused)
  }

  @ViewBuilder
  var timeField: some View {
    DatePicker(
      selection: $date,
      displayedComponents: .hourAndMinute
    ) {
      Label {
        Text(
          "reminder-create.page.time-picker",
          bundle: .module
        )
      } icon: {
        Image(systemName: "clock")
          .foregroundStyle(.secondary)
      }
    }
  }

  @ViewBuilder
  var repeatField: some View {
    Toggle(isOn: $isRepeatable) {
      Label {
        Text(
          "reminder-create.page.repeat-toggle",
          bundle: .module
        )
      } icon: {
        Image(systemName: "repeat")
          .foregroundStyle(.secondary)
      }
    }
  }

  @ViewBuilder
  var notificationField: some View {
    Toggle(isOn: $isNotifiable) {
      Label {
        Text(
          "reminder-create.page.notification-toggle",
          bundle: .module
        )
      } icon: {
        Image(systemName: "bell")
          .foregroundStyle(.secondary)
      }
    }
  }

  @ViewBuilder
  var submitButton: some View {
    Button(
      action: didCreateButtonTouched
    ) {
      Text(
        "reminder-create.page.button",
        bundle: .module
      )
      .frame(maxWidth: .infinity)
      .padding(.vertical, 8.0)
    }
    .buttonStyle(.borderedProminent)
    .disabled(title.isEmpty)
  }

}
