//
// ReminderListRouteHandler.swift
// ReminderList
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface
import ReminderListInterface

public struct ReminderListRouteHandler: RouteHandler {

  public var routes: [any Route.Type] = [
    ReminderListRoute.self
  ]

  public init() { }

  public func destination(
    forRoute route: any Route
  ) -> any Feature.Type {

    return ReminderListFeature.self

  }

}
