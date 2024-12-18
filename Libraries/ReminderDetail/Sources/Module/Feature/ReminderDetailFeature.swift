//
// ReminderDetailFeature.swift
// ReminderDetail
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//

import BuilderInterface
import ReminderStoreInterface
import ReminderDetailInterface

struct ReminderDetailFeature: Feature {

  @Service var store: ReminderStoreProtocol

  func build(
    fromRoute route: any Route
  ) -> some View {

    guard let route = route as? ReminderDetailRoute else {
      preconditionFailure()
    }

    return ReminderDetailPage(
      store: store,
      reminderId: route.reminderId
    )

  }

}
