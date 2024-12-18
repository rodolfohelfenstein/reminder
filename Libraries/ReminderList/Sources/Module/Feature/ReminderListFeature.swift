//
// ReminderListFeature.swift
// ReminderList
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface
import ReminderStoreInterface

struct ReminderListFeature: Feature {

  @Service var builder: Builder
  @Service var store: ReminderStoreProtocol

  func build(
    fromRoute route: any Route
  ) -> some View {

    ReminderListPage(
      builder: builder,
      store: store
    )

  }

}
