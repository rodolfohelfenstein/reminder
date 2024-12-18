//
// ReminderDetailRouteHandler.swift
// ReminderDetail
//
//
// Created by Rodolfo Helfenstein Bulgam on 18/12/24.
//

import BuilderInterface
import ReminderDetailInterface

public struct ReminderDetailRouteHandler: RouteHandler {

  public var routes: [any Route.Type] = [ ReminderDetailRoute.self ]

  public init() { }

  public func destination(
    forRoute route: any Route
  ) -> any Feature.Type {

    ReminderDetailFeature.self

  }

}
