//
// ReminderListPage.swift
// ReminderList
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import SwiftUI
import BuilderInterface
import ReminderStoreInterface
import ReminderDetailInterface

@MainActor
struct ReminderListPage {

  let builder: Builder
  let store: ReminderStoreProtocol

  @State var selectedReminder: Reminder?

  @Namespace private var namespace

}

extension ReminderListPage: View {

  var body: some View {

    VStack {

      content

    }
    .animation(.spring, value: store.reminders.isEmpty)
    .sheet(
      item: $selectedReminder
    ) {
      builder
        .build(forRoute: ReminderDetailRoute($0.id))
    }

  }

  @ViewBuilder
  var content: some View {
    if store.reminders.isEmpty {
      empty
    } else {
      reminders
    }
  }

  @ViewBuilder
  var empty: some View {

    VStack(
      spacing: 8.0
    ) {

      Text(
        "reminder.list.empty.description",
        bundle: .module
      )
      .font(.title2)
      .foregroundStyle(.secondary)

    }

  }

  @ViewBuilder
  var reminders: some View {

    List {

      ForEach(store.reminders) { reminder in

        Button {

          selectedReminder = reminder

        } label: {

          Text(reminder.title)

        }
        .swipeActions {

          Button {
            try? store.remove(reminder)
          } label: {
            Text("reminder.list.item.delete", bundle: .module)
          }
          .tint(.red)

        }

      }

    }
    .listStyle(.insetGrouped)

  }

}
