//
// HomePage.swift
// Home
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//
    
import SwiftUI
import BuilderInterface
import ReminderListInterface
import ReminderCreateInterface

@MainActor
struct HomePage {

  let builder: Builder

  @State var isReminderCreatePresented = false

}

extension HomePage: View {

  var body: some View {

    VStack {

      header
        .padding(.vertical, 24.0)
        .padding(.horizontal, 16.0)

      Spacer()

      builder.build(forRoute: ReminderListRoute())

      Spacer()

    }
    .ignoresSafeArea(edges: .bottom)
    .sheet(isPresented: $isReminderCreatePresented) {

      builder.build(forRoute: ReminderCreateRoute())

    }

  }

  @ViewBuilder
  var header: some View {

    HStack {

      Text("home.page.title", bundle: .module)
        .font(.title)

      Spacer()

      Button {
        isReminderCreatePresented = true
      } label: {
        Image(systemName: "plus")
      }

    }

  }

}
