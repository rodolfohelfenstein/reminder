//
// ReminderCreateFeature.swift
// ReminderCreate
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface
import ReminderStoreInterface

struct ReminderCreateFeature: Feature {

  @Service var store: ReminderStoreProtocol

  func build(
    fromRoute route: any Route
  ) -> some View {

    ReminderCreatePage(store: store)

  }

}
