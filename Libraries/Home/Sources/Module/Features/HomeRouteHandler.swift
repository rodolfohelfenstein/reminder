//
// HomeRouteHandler.swift
// Home
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface
import HomeInterface

public struct HomeRouteHandler: RouteHandler {

  public var routes: [any Route.Type] = [
    HomeRoute.self
  ]

  public init() { }

  public func destination(
    forRoute route: any Route
  ) -> any Feature.Type {

    HomeFeature.self

  }

}
