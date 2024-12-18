//
// ReminderCreateRouteHandler.swift
// ReminderCreate
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface
import ReminderCreateInterface

public struct ReminderCreateRouteHandler: RouteHandler {

  public var routes: [any Route.Type] = [ ReminderCreateRoute.self ]

  public init() { }

  public func destination(
    forRoute route: any Route
  ) -> any Feature.Type {

    ReminderCreateFeature.self

  }

}
